import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/app_colors.dart';
import '../data/dummy_categories.dart';
import '../data/dummy_products.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  /// null = show category grid; non-null = show products for that category
  Category? _selectedCategory;

  // ── Helpers ──────────────────────────────────────────────────────────────
  List<Product> get _filteredProducts => _selectedCategory == null
      ? []
      : dummyProducts
          .where((p) => p.categoryId == _selectedCategory!.id)
          .toList();

  // ── Build ─────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF4D3),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: _selectedCategory != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFF757575)),
                onPressed: () => setState(() => _selectedCategory = null),
              )
            : null,
        title: Text(
          _selectedCategory != null ? _selectedCategory!.name : 'Categories',
          style: const TextStyle(
            color: Color(0xFF757575),
            fontWeight: FontWeight.w800,
            fontSize: 18,
            letterSpacing: 0.4,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(height: 2, color: const Color(0xFFE6BC15)),
        ),
      ),
      body: _selectedCategory == null
          ? _buildCategoryGrid()
          : _buildProductGrid(),
    );
  }

  // ── Category 2-Column Grid ────────────────────────────────────────────────
  Widget _buildCategoryGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:   2,
        crossAxisSpacing: 10,
        mainAxisSpacing:  10,
        childAspectRatio: 0.88, // slightly taller than square for label
      ),
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        final cat = dummyCategories[index];
        return _CategoryCard(
          category: cat,
          onTap: () => setState(() => _selectedCategory = cat),
        );
      },
    );
  }

  // ── Filtered Products Grid ────────────────────────────────────────────────
  Widget _buildProductGrid() {
    final products = _filteredProducts;

    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_basket_outlined,
                size: 80,
                color: const Color(0xFFE6BC15).withValues(alpha: 0.5)),
            const SizedBox(height: 16),
            Text(
              'No products in this category yet',
              style: TextStyle(
                  fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:   2,
        crossAxisSpacing: 10,
        mainAxisSpacing:  10,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _ProductCard(product: product);
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Category Card — matches the reference image (large image + bold name)
// ─────────────────────────────────────────────────────────────────────────────
class _CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const _CategoryCard({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Category image — takes up ~75% of card height
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft:  Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                child: Image.asset(
                  category.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFF0ECD8),
                    child: const Icon(Icons.bakery_dining,
                        color: Color(0xFFE6BC15), size: 48),
                  ),
                ),
              ),
            ),

            // Bold uppercase name
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  category.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize:      13,
                    fontWeight:    FontWeight.w800,
                    color:         Color(0xFF0F0F0F),
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Product Card — shown after tapping a category
// ─────────────────────────────────────────────────────────────────────────────
class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/product-detail',
        arguments: product.id,
      ),
      child: Container(
        decoration: BoxDecoration(
          color:        Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color:      Colors.black.withValues(alpha: 0.07),
              blurRadius: 8,
              offset:     const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft:  Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  product.imageUrl,
                  fit:   BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFF0ECD8),
                    child: const Icon(Icons.image_not_supported,
                        color: AppColors.accent),
                  ),
                ),
              ),
            ),

            // Name + price + add button
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize:   13,
                      color:      Color(0xFF0F0F0F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs. ${product.price}',
                        style: const TextStyle(
                          color:      Color(0xFFE6BC15),
                          fontWeight: FontWeight.w800,
                          fontSize:   13,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cart.addItem(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product.name} added to cart'),
                              duration: const Duration(seconds: 1),
                              backgroundColor: const Color(0xFFE6BC15),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color:     Color(0xFFE6BC15),
                            shape:     BoxShape.circle,
                          ),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
