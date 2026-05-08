import 'package:flutter/foundation.dart';
import '../data/dummy_products.dart';
import '../models/cart_item.dart';
import 'supabase_service.dart';

/// Syncs the in-memory cart with the Supabase `cart` table.
///
/// Products are looked up from local dummy data using the stored `product_id`.
class CartService {
  final _client = SupabaseService.client;

  /// Load all cart rows for [userId] and resolve them to [CartItem]s.
  Future<List<CartItem>> loadCart(String userId) async {
    final rows = await _client
        .from('cart')
        .select()
        .eq('user_id', userId) as List<dynamic>;

    final items = <CartItem>[];
    for (final row in rows) {
      final productId = row['product_id'] as String;
      final quantity = row['quantity'] as int;
      try {
        final product = dummyProducts.firstWhere((p) => p.id == productId);
        items.add(CartItem(product: product, quantity: quantity));
      } catch (_) {
        // Product was removed from dummy data — skip silently
        debugPrint('CartService: unknown product_id $productId, skipping');
      }
    }
    return items;
  }

  /// Insert or update a cart row (upsert on unique user_id+product_id).
  Future<void> upsertItem(
    String userId,
    String productId,
    int quantity,
  ) async {
    await _client.from('cart').upsert(
      {
        'user_id': userId,
        'product_id': productId,
        'quantity': quantity,
      },
      onConflict: 'user_id,product_id',
    );
  }

  /// Delete a single product row from the cart.
  Future<void> removeItem(String userId, String productId) async {
    await _client
        .from('cart')
        .delete()
        .eq('user_id', userId)
        .eq('product_id', productId);
  }

  /// Delete all cart rows for [userId] (used after order placement).
  Future<void> clearCart(String userId) async {
    await _client.from('cart').delete().eq('user_id', userId);
  }
}
