import 'cart_item.dart';
import 'product.dart';

// ── Status ─────────────────────────────────────────────────────────────────

enum OrderStatus {
  pending,
  confirmed,
  preparing,
  dispatched,
  outForDelivery,
  delivered,
  cancelled,
}

/// Maps [OrderStatus] to/from the DB string values used in Supabase.
extension OrderStatusX on OrderStatus {
  String get dbValue {
    switch (this) {
      case OrderStatus.confirmed:
        return 'confirmed';
      case OrderStatus.preparing:
        return 'preparing';
      case OrderStatus.dispatched:
        return 'dispatched';
      case OrderStatus.outForDelivery:
        return 'on_the_way';
      case OrderStatus.delivered:
        return 'delivered';
      case OrderStatus.cancelled:
        return 'cancelled';
      case OrderStatus.pending:
        return 'confirmed';
    }
  }

  /// Human-readable label shown in UI.
  String get label {
    switch (this) {
      case OrderStatus.confirmed:
        return 'Order Confirmed';
      case OrderStatus.preparing:
        return 'Preparing';
      case OrderStatus.dispatched:
        return 'Dispatched';
      case OrderStatus.outForDelivery:
        return 'On The Way';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      case OrderStatus.pending:
        return 'Pending';
    }
  }

  static OrderStatus fromDb(String value) {
    switch (value) {
      case 'preparing':
        return OrderStatus.preparing;
      case 'dispatched':
        return OrderStatus.dispatched;
      case 'on_the_way':
        return OrderStatus.outForDelivery;
      case 'delivered':
        return OrderStatus.delivered;
      case 'cancelled':
        return OrderStatus.cancelled;
      case 'confirmed':
      default:
        return OrderStatus.confirmed;
    }
  }
}

// ── Order ──────────────────────────────────────────────────────────────────

class Order {
  final String id;
  final List<CartItem> items;
  final double total;
  OrderStatus status;
  final DateTime createdAt;
  final String deliveryAddress;

  Order({
    required this.id,
    required this.items,
    required this.total,
    this.status = OrderStatus.pending,
    required this.createdAt,
    required this.deliveryAddress,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final rawItems =
        (json['order_items'] as List<dynamic>?) ?? <dynamic>[];

    final items = rawItems.map((raw) {
      final m = raw as Map<String, dynamic>;
      final product = Product(
        id: m['product_id'] as String,
        name: m['product_name'] as String,
        categoryId: '',
        price: (m['price'] as num).toDouble(),
        imageUrl: '',
        description: '',
      );
      return CartItem(
        product: product,
        quantity: m['quantity'] as int,
      );
    }).toList();

    return Order(
      id: json['id'] as String,
      items: items,
      total: (json['total_price'] as num).toDouble(),
      status:
          OrderStatusX.fromDb((json['status'] as String?) ?? 'confirmed'),
      createdAt: DateTime.parse(json['created_at'] as String),
      deliveryAddress: (json['delivery_address'] as String?) ?? '',
    );
  }
}
