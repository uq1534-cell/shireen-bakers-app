import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../data/dummy_categories.dart';
import '../data/dummy_products.dart';
import '../widgets/banner_slider.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            pinned: true,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Shireen Bakers'),
              background: Padding(
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 8),
                child: AppSearchBar(
                  onSearch: (query) {/* handle search */},
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              const BannerSlider(),
              const SizedBox(height: 16),
              _sectionTitle('Categories'),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoryChip(
                    category: dummyCategories[index],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: dummyCategories.length,
                ),
              ),
              const SizedBox(height: 16),
              _sectionTitle('Popular Items'),
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) => ProductCard(product: dummyProducts[i]),
                childCount: dummyProducts.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.78,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      );
}
