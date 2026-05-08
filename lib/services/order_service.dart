import '../models/cart_item.dart';
import '../models/order.dart';
import 'supabase_service.dart';

/// Manages order placement and retrieval via Supabase.
class OrderService {
  final _client = SupabaseService.client;

  /// Insert a new order and its items; returns the persisted [Order].
  Future<Order> placeOrder(
    String userId,
    List<CartItem> items,
    double total,
    String address,
  ) async {
    // 1. Insert the order row
    final orderRow = await _client
        .from('orders')
        .insert({
          'user_id': userId,
          'total_price': total,
          'delivery_address': address,
          'status': 'confirmed',
        })
        .select()
        .single();

    final orderId = orderRow['id'] as String;

    // 2. Insert order_items
    final itemRows = items
        .map(
          (item) => {
            'order_id': orderId,
            'product_id': item.product.id,
            'product_name': item.product.name,
            'quantity': item.quantity,
            'price': item.product.price,
          },
        )
        .toList();

    await _client.from('order_items').insert(itemRows);

    // 3. Return hydrated Order model
    return Order(
      id: orderId,
      items: items,
      total: total,
      status: OrderStatus.confirmed,
      createdAt: DateTime.parse(orderRow['created_at'] as String),
      deliveryAddress: address,
    );
  }

  /// Fetch all orders for [userId] with their items, newest first.
  Future<List<Order>> fetchOrders(String userId) async {
    final rows = await _client
        .from('orders')
        .select('*, order_items(*)')
        .eq('user_id', userId)
        .order('created_at', ascending: false) as List<dynamic>;

    return rows
        .map((row) => Order.fromJson(row as Map<String, dynamic>))
        .toList();
  }
}
