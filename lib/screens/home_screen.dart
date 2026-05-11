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
  final void Function(int)? onSwitchTab;
  const HomeScreen({super.key, this.onSwitchTab});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _banners = const [
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Navigator.pushNamed(context, '/chat'),
        child: const Icon(Icons.chat_bubble_rounded, color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: [
          // ── Compact Search Header ─────────────────────────────────────
          SliverPersistentHeader(
            pinned: true,
            delegate: _CompactSearchHeader(
              onCartTap: () => widget.onSwitchTab?.call(3),
              onLoginTap: () => Navigator.pushNamed(context, '/login'),
              onMenuTap: (ctx) => Scaffold.of(ctx).openDrawer(),
            ),
          ),

          // ── Hero Slider ───────────────────────────────────────────────
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 340,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 700),
                enlargeCenterPage: true,
                enlargeFactor: 0.15,
                viewportFraction: 0.97,
                onPageChanged: (_, __) => setState(() {}),
              ),
              items: _banners
                  .map((b) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(b,
                              fit: BoxFit.cover, width: double.infinity),
                        ),
                      ))
                  .toList(),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 22)),

          // ── Categories Label ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(children: [
                Container(
                  width: 4,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                Text('Categories',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark)),
              ]),
            ),
          ),

          // ── Horizontal Categories ─────────────────────────────────────
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: List.generate(
                  dummyCategories.length,
                  (i) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _buildCategoryItem(
                      dummyCategories[i],
                      i == _selectedCategoryIndex,
                      () => Navigator.pushNamed(
                        context,
                        '/categories',
                        arguments: dummyCategories[i],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 22)),

          // ── Featured Products Label ───────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(children: [
                Container(
                  width: 4,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                Text('Featured Products',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark)),
              ]),
            ),
          ),

          // ── Products Grid ─────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) => ProductCard(product: dummyProducts[i]),
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

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(dynamic cat, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 76,
          width: 76,
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? AppColors.accent : AppColors.border,
              width: selected ? 3 : 1.5,
            ),
            borderRadius: BorderRadius.circular(14),
            color: AppColors.cardBg,
            boxShadow: [
              BoxShadow(
                color: selected
                    ? AppColors.accent.withValues(alpha: 0.35)
                    : Colors.black.withValues(alpha: 0.06),
                blurRadius: selected ? 10 : 4,
                spreadRadius: selected ? 1 : 0,
                offset: selected ? Offset.zero : const Offset(0, 2),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(cat.imageUrl, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 76,
          child: Text(cat.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected ? AppColors.primary : AppColors.textDark,
              )),
        ),
      ]),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    const navItems = [
      ('HOME', '/'),
      ('MENU', '/categories'),
      ('LOCATIONS', '/store-locator'),
      ('ABOUT US', '/about'),
      ('FEEDBACK', '/feedback'),
      ('PRIVACY POLICY', '/privacy'),
    ];
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ...navItems.map((item) {
              final (label, route) = item;
              return Column(children: [
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
                      child: Text(label,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2B1A0E),
                            letterSpacing: 0.5,
                          )),
                    ),
                  ),
                ),
                const Divider(
                    height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
              ]);
            }),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Text('ALL CATEGORIES',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.4,
                  )),
            ),
            ...dummyCategories.map((cat) {
              final idx = dummyCategories.indexOf(cat);
              return InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategoryIndex = idx);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(cat.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFC8892A),
                      )),
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

// ─────────────────────────────────────────────────────────────────────────────
// Compact Search Header
// ─────────────────────────────────────────────────────────────────────────────
class _CompactSearchHeader extends SliverPersistentHeaderDelegate {
  final VoidCallback onCartTap;
  final VoidCallback onLoginTap;
  final void Function(BuildContext) onMenuTap;

  const _CompactSearchHeader({
    required this.onCartTap,
    required this.onLoginTap,
    required this.onMenuTap,
  });

  static const double _h = 116;

  @override
  double get minExtent => _h;
  @override
  double get maxExtent => _h;
  @override
  bool shouldRebuild(covariant _CompactSearchHeader old) => false;

  @override
  Widget build(BuildContext ctx, double shrinkOffset, bool overlaps) {
    return Consumer2<CartProvider, AuthProvider>(
      builder: (context, cart, auth, _) {
        final count = cart.items.length;
        final loggedIn = auth.isLoggedIn;

        return Container(
          height: _h,
          decoration: const BoxDecoration(
            color: Color(0xFFFAF4D3), // website cream background
            border: Border(
                bottom: BorderSide(color: Color(0xFFE6BC15), width: 2.5)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x18000000),
                  blurRadius: 10,
                  offset: Offset(0, 3))
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row 1 — hamburger | logo | login + cart
                SizedBox(
                  height: 54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      // Hamburger
                      Builder(
                          builder: (bCtx) => IconButton(
                                onPressed: () => onMenuTap(bCtx),
                                icon: const Icon(Icons.menu_rounded,
                                    color: Color(0xFF5A3E1B), size: 26),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                    minWidth: 36, minHeight: 36),
                              )),

                      // Logo + brand name stacked
                      Expanded(
                          child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/logo_transparent.png',
                              height: 34,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.cake_rounded,
                                color: Color(0xFFE6BC15),
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 2),
                            RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                  text: 'SHIREEN ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF757575),
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text: 'BAKERS',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFFE6BC15),
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      )),

                      // Login / Account pill
                      GestureDetector(
                        onTap: loggedIn
                            ? () => Navigator.pushNamed(context, '/account')
                            : onLoginTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: loggedIn
                                ? const Color(0xFFE6BC15)
                                : const Color(0xFF757575),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            loggedIn ? 'Account' : 'Login',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Cart icon + badge
                      GestureDetector(
                        onTap: onCartTap,
                        child: Stack(clipBehavior: Clip.none, children: [
                          const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.shopping_cart_outlined,
                                color: Color(0xFF0F0F0F), size: 25),
                          ),
                          if (count > 0)
                            Positioned(
                              top: -2,
                              right: -2,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE6BC15),
                                  shape: BoxShape.circle,
                                ),
                                child: Text('$count',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                        ]),
                      ),
                    ]),
                  ),
                ),

                // Row 2 — search bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 6),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: const Color(0xFFE6BC15), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.07),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(children: const [
                      SizedBox(width: 14),
                      Icon(Icons.search_rounded,
                          color: Color(0xFFE6BC15), size: 20),
                      SizedBox(width: 8),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for cakes, bread, pastries...',
                          hintStyle:
                              TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFF0F0F0F)),
                      )),
                      SizedBox(width: 10),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
