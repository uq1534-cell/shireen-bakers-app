import 'package:flutter/material.dart';
import '../models/product.dart';
import '../config/app_routes.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(product.imageUrl, width: 60, fit: BoxFit.cover),
        title: Text(product.name),
        subtitle: Text('PKR ${product.price.toStringAsFixed(0)}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.of(context).pushNamed(
          AppRoutes.productDetail,
          arguments: product.id,
        ),
      ),
    );
  }
}
