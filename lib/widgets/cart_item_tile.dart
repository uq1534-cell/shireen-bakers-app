import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(item.product.imageUrl, width: 56, fit: BoxFit.cover),
      title: Text(item.product.name),
      subtitle: Text(
          'Qty: ${item.quantity} • PKR ${item.subtotal.toStringAsFixed(0)}'),
      trailing: const Icon(Icons.delete_outline),
    );
  }
}
