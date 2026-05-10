import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const BottomNavBar({super.key, this.currentIndex = 0, this.onTap});

  static const _active   = Color(0xFFC8892A); // golden brown
  static const _inactive = Color(0xFF9E9E9E); // muted grey

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, _) {
        final cartCount = cart.items.length;

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFFEEEEEE), width: 1),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 12,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: _active,
            unselectedItemColor: _inactive,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 11,
              letterSpacing: 0.1,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
            items: [
              // ── Home ─────────────────────────────────────────────────────
              const BottomNavigationBarItem(
                icon:       Icon(Icons.home_outlined,  size: 26),
                activeIcon: Icon(Icons.home_rounded,   size: 26),
                label:      'Home',
              ),

              // ── Categories ───────────────────────────────────────────────
              const BottomNavigationBarItem(
                icon:       Icon(Icons.grid_view_outlined, size: 26),
                activeIcon: Icon(Icons.grid_view_rounded,  size: 26),
                label:      'Categories',
              ),

              // ── Account ──────────────────────────────────────────────────
              const BottomNavigationBarItem(
                icon:       Icon(Icons.person_outline_rounded, size: 26),
                activeIcon: Icon(Icons.person_rounded,         size: 26),
                label:      'Account',
              ),

              // ── My Cart (with badge) ─────────────────────────────────────
              BottomNavigationBarItem(
                icon: _CartIcon(count: cartCount, active: false),
                activeIcon: _CartIcon(count: cartCount, active: true),
                label: 'My Cart',
              ),

              // ── More ─────────────────────────────────────────────────────
              const BottomNavigationBarItem(
                icon:       Icon(Icons.menu_rounded, size: 26),
                activeIcon: Icon(Icons.menu_rounded, size: 26,
                    color: Color(0xFFC8892A)),
                label:      'More',
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Cart icon with a badge that always shows the item count (0 when empty).
class _CartIcon extends StatelessWidget {
  final int  count;
  final bool active;

  const _CartIcon({required this.count, required this.active});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          active
              ? Icons.shopping_cart_rounded
              : Icons.shopping_cart_outlined,
          size:  26,
          color: active
              ? const Color(0xFFC8892A)
              : const Color(0xFF9E9E9E),
        ),
        Positioned(
          top:   -5,
          right: -7,
          child: Container(
            constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: count > 0
                  ? const Color(0xFFC8892A)
                  : const Color(0xFF9E9E9E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                color:      Colors.white,
                fontSize:   9,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
