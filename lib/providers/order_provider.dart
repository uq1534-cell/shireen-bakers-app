import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/order.dart';

class OrderProvider extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void placeOrder(List<CartItem> items, String address) {
    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: items,
      total: items.fold(0.0, (sum, item) => sum + item.subtotal),
      createdAt: DateTime.now(),
      deliveryAddress: address,
    );
    _orders.insert(0, order);
    notifyListeners();
  }

  void updateOrderStatus(String orderId, OrderStatus status) {
    final index = _orders.indexWhere((order) => order.id == orderId);
    if (index >= 0) {
      _orders[index].status = status;
      notifyListeners();
    }
  }

  Order? findById(String orderId) {
    try {
      return _orders.firstWhere((order) => order.id == orderId);
    } catch (_) {
      return null;
    }
  }
}
