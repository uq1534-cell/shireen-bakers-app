import 'cart_item.dart';

enum OrderStatus {
  pending,
  confirmed,
  dispatched,
  outForDelivery,
  delivered,
  canceled,
}

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
}
