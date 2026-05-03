import 'package:flutter/material.dart';
import '../models/product.dart';

class CategoryChip extends StatelessWidget {
  final Category category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(backgroundImage: AssetImage(category.imageUrl)),
      label: Text(category.name),
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }
}
