import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../services/cart_service.dart';
import '../services/supabase_service.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  final _cartService = CartService();
  bool _isLoading = false;

  Map<String, CartItem> get items => {..._items};

  /// Alias kept for backward-compat with any existing widget references.
  Map<String, CartItem> get cartItems => items;

  int get itemCount =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount =>
      _items.values.fold(0.0, (sum, item) => sum + item.subtotal);

  bool get isLoading => _isLoading;

  String? get _userId => SupabaseService.currentUser?.id;

  // ── Remote load ───────────────────────────────────────────────────────────

  /// Replace in-memory cart with the user's persisted Supabase cart.
  /// Called after a successful login or session restore.
  Future<void> loadFromSupabase() async {
    final uid = _userId;
    if (uid == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      final loaded = await _cartService.loadCart(uid);
      _items.clear();
      for (final item in loaded) {
        _items[item.product.id] = item;
      }
    } catch (e) {
      debugPrint('CartProvider.loadFromSupabase error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ── Mutations ─────────────────────────────────────────────────────────────

  void addItem(Product product, {int quantity = 1}) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
    _syncUpsert(product.id, _items[product.id]!.quantity);
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
    final uid = _userId;
    if (uid != null) {
      _cartService.removeItem(uid, productId).catchError((dynamic e) {
        debugPrint('CartProvider.removeItem error: $e');
      });
    }
  }

  void updateQuantity(String productId, int quantity) {
    if (!_items.containsKey(productId)) return;

    if (quantity <= 0) {
      removeItem(productId);
      return;
    }

    _items[productId]!.quantity = quantity;
    notifyListeners();
    _syncUpsert(productId, quantity);
  }

  /// Clear locally AND from Supabase (used after order placement).
  void clearCart() {
    _items.clear();
    notifyListeners();
    final uid = _userId;
    if (uid != null) {
      _cartService.clearCart(uid).catchError((dynamic e) {
        debugPrint('CartProvider.clearCart error: $e');
      });
    }
  }

  /// Clear only the local in-memory cart (e.g. on logout).
  void clearLocalCart() {
    _items.clear();
    notifyListeners();
  }

  // ── Internal helpers ──────────────────────────────────────────────────────

  void _syncUpsert(String productId, int quantity) {
    final uid = _userId;
    if (uid == null) return;
    _cartService.upsertItem(uid, productId, quantity).catchError((dynamic e) {
      debugPrint('CartProvider._syncUpsert error: $e');
    });
  }
}
