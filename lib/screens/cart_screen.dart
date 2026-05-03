import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: cart.items.isEmpty
            ? const Center(child: Text('Your cart is empty.'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Total: PKR ${cart.totalAmount.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView(
                      children: cart.items.values
                          .map((item) => ListTile(
                                title: Text(item.product.name),
                                subtitle: Text('Qty: ${item.quantity}'),
                                trailing: Text(
                                    'PKR ${item.subtotal.toStringAsFixed(0)}'),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
