import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../config/app_colors.dart';
import '../data/dummy_categories.dart';
import '../data/dummy_products.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _promotionalBanners = const [
    'assets/images/main.png',
    'assets/images/cakehtml.jpg',
    'assets/images/promo_cakes.png',
    'assets/images/promo_gifts.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      drawer: _buildDrawer(context),
      body: CustomScrollView(
        slivers: [
          // ── Two-Row Premium Header ───────────────────────────────────────
          SliverPersistentHeader(
            pinned: true,
            delegate: _TwoRowHeaderDelegate(
              onCartTap: () => Navigator.pushNamed(context, '/cart'),
              onLoginTap: () => Navigator.pushNamed(context, '/login'),
              onMenuTap: (ctx) => Scaffold.of(ctx).openDrawer(),
              onCategoryTap: (index) =>
                  setState(() => _selectedCategoryIndex = index),
              selectedCategoryIndex: _selectedCategoryIndex,
            ),
          ),

          // ── Hero Banner Slider ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 220,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                  viewportFraction: 0.93,
                  onPageChanged: (_, __) => setState(() {}),
                ),
                items: _promotionalBanners.map((banner) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(banner, fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // ── Categories Section ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(
                  dummyCategories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: _buildCategoryItem(
                      dummyCategories[index],
                      index == _selectedCategoryIndex,
                      () => setState(() => _selectedCategoryIndex = index),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // ── Featured Products ───────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Featured Products',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) => ProductCard(product: dummyProducts[index]),
                childCount: dummyProducts.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(dynamic category, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.accent : AppColors.border,
                width: isSelected ? 3 : 1.5,
              ),
              borderRadius: BorderRadius.circular(14),
              color: AppColors.cardBg,
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? AppColors.accent.withValues(alpha: 0.35)
                      : Colors.black.withValues(alpha: 0.06),
                  blurRadius: isSelected ? 10 : 4,
                  spreadRadius: isSelected ? 1 : 0,
                  offset: isSelected ? Offset.zero : const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(category.imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 72,
            child: Text(
              category.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? AppColors.primary : AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    // Nav items: label → route
    const navItems = [
      ('HOME', '/'),
      ('MENU', '/menu'),
      ('LOCATIONS', '/locations'),
      ('ABOUT US', '/about'),
      ('FEEDBACK', '/feedback'),
      ('PRIVACY POLICY', '/privacy-policy'),
    ];

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // ── Nav items ──────────────────────────────────────────────
            ...navItems.map((item) {
              final (label, route) = item;
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, route);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          label,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2B1A0E),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1,
                      color: Color(0xFFEEEEEE), indent: 0, endIndent: 0),
                ],
              );
            }),

            // ── All Categories header ───────────────────────────────────
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Text(
                'ALL CATEGORIES',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9E9E9E),
                  letterSpacing: 1.4,
                ),
              ),
            ),

            // ── Category list ───────────────────────────────────────────
            ...dummyCategories.map((cat) {
              final idx = dummyCategories.indexOf(cat);
              return InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategoryIndex = idx);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  child: Text(
                    cat.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFC8892A),
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ── Two-Row Header Delegate ────────────────────────────────────────────────────
class _TwoRowHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback onCartTap;
  final VoidCallback onLoginTap;
  final void Function(BuildContext ctx) onMenuTap;
  final void Function(int index) onCategoryTap;
  final int selectedCategoryIndex;

  // Left nav: first 5 categories; Right nav: next 5 categories
  static const _leftCats = ['Cakes', 'Pastries', 'Biscuits', 'Bread', 'Rusk'];
  static const _rightCats = ['Snacks', 'Donuts', 'Ice Cream', 'Cookies', 'Puffs'];

  const _TwoRowHeaderDelegate({
    required this.onCartTap,
    required this.onLoginTap,
    required this.onMenuTap,
    required this.onCategoryTap,
    required this.selectedCategoryIndex,
  });

  @override
  double get minExtent => 108;
  @override
  double get maxExtent => 108;

  @override
  bool shouldRebuild(covariant _TwoRowHeaderDelegate old) =>
      old.selectedCategoryIndex != selectedCategoryIndex;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Consumer2<CartProvider, AuthProvider>(
      builder: (context, cart, auth, _) {
        final itemCount = cart.items.length;
        final isLoggedIn = auth.isLoggedIn;

        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF5EDD8), // warm cream matching reference
            border: Border(
              bottom: BorderSide(color: Color(0xFFC8892A), width: 2.5),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // ── Row 1: Menu | Logo | Login + Cart ───────────────────────
              SizedBox(
                height: 56,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      // Hamburger
                      Builder(
                        builder: (ctx) => IconButton(
                          onPressed: () => onMenuTap(ctx),
                          icon: const Icon(Icons.menu_rounded,
                              color: Color(0xFF5A3E1B), size: 26),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                        ),
                      ),

                      // Centered logo
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/logo_transparent.png',
                            height: 40,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.cake_rounded,
                              color: Color(0xFFC8892A),
                              size: 34,
                            ),
                          ),
                        ),
                      ),

                      // Login button
                      if (!isLoggedIn)
                        GestureDetector(
                          onTap: onLoginTap,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B2B1A),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      else
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/profile'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                      const SizedBox(width: 8),

                      // Cart count + icon
                      GestureDetector(
                        onTap: onCartTap,
                        child: Row(
                          children: [
                            Text(
                              '($itemCount)',
                              style: const TextStyle(
                                color: Color(0xFF5A3E1B),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Icon(Icons.shopping_cart_outlined,
                                color: Color(0xFF5A3E1B), size: 22),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Row 2: Left cats | SHIREEN BAKERS | Right cats ──────────
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    // Left categories
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: _leftCats.map((name) {
                            final idx = dummyCategories
                                .indexWhere((c) => c.name.toLowerCase() == name.toLowerCase());
                            final selected = idx == selectedCategoryIndex;
                            return GestureDetector(
                              onTap: idx >= 0 ? () => onCategoryTap(idx) : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: selected
                                        ? AppColors.accent
                                        : const Color(0xFF5A3E1B),
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    // Center brand name
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SHIREEN',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF5A3E1B),
                            letterSpacing: 2,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          'BAKERS',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFC8892A),
                            letterSpacing: 2,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),

                    // Right categories
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: _rightCats.map((name) {
                            final idx = dummyCategories
                                .indexWhere((c) => c.name.toLowerCase() == name.toLowerCase());
                            final selected = idx == selectedCategoryIndex;
                            return GestureDetector(
                              onTap: idx >= 0 ? () => onCategoryTap(idx) : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: selected
                                        ? AppColors.accent
                                        : const Color(0xFF5A3E1B),
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
