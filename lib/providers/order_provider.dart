import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/order.dart';
import '../services/order_service.dart';
import '../services/supabase_service.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orders = [];
  bool _isLoading = false;
  String? _error;

  final _orderService = OrderService();

  List<Order> get orders => [..._orders];
  bool get isLoading => _isLoading;
  String? get error => _error;
  Order? get latestOrder => _orders.isNotEmpty ? _orders.first : null;

  // ── Fetch ─────────────────────────────────────────────────────────────────

  Future<void> fetchOrders() async {
    final uid = SupabaseService.currentUser?.id;
    if (uid == null) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _orders = await _orderService.fetchOrders(uid);
    } catch (e) {
      _error = e.toString();
      debugPrint('OrderProvider.fetchOrders error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ── Place order ───────────────────────────────────────────────────────────

  Future<Order> placeOrder(List<CartItem> items, String address) async {
    final uid = SupabaseService.currentUser?.id;
    if (uid == null) throw Exception('You must be logged in to place an order.');

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final total = items.fold(0.0, (sum, i) => sum + i.subtotal);
      final order = await _orderService.placeOrder(uid, items, total, address);
      _orders.insert(0, order);
      return order;
    } catch (e) {
      _error = e.toString();
      debugPrint('OrderProvider.placeOrder error: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ── Local helpers ─────────────────────────────────────────────────────────

  void updateOrderStatus(String orderId, OrderStatus status) {
    final index = _orders.indexWhere((o) => o.id == orderId);
    if (index >= 0) {
      _orders[index].status = status;
      notifyListeners();
    }
  }

  Order? findById(String orderId) {
    try {
      return _orders.firstWhere((o) => o.id == orderId);
    } catch (_) {
      return null;
    }
  }

  void clearOrders() {
    _orders = [];
    notifyListeners();
  }
}
