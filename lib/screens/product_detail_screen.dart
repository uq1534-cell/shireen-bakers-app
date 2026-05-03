import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Product ID: $productId',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              const Text('Details for this product will appear here.'),
            ],
          ),
        ),
      ),
    );
  }
}
