import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const BottomNavBar({super.key, this.currentIndex = 0, this.onTap});

  static const _cream  = Color(0xFFFDF8F2);
  static const _gold   = Color(0xFFC8892A);
  static const _muted  = Color(0xFFAA9070);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _cream,
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color:      Color(0x2A000000),
            blurRadius: 18,
            offset:     Offset(0, -4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft:  Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        child: BottomNavigationBar(
          currentIndex:          currentIndex,
          onTap:                 onTap,
          type:                  BottomNavigationBarType.fixed,
          elevation:             0,
          backgroundColor:       _cream,
          selectedItemColor:     _gold,
          unselectedItemColor:   _muted,
          selectedLabelStyle:    const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize:   11,
            letterSpacing: 0.2,
          ),
          unselectedLabelStyle:  const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize:   11,
          ),
          iconSize: 26,
          items: const [
            BottomNavigationBarItem(
              icon:       Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label:      'Home',
            ),
            BottomNavigationBarItem(
              icon:       Icon(Icons.grid_view_outlined),
              activeIcon: Icon(Icons.grid_view_rounded),
              label:      'Categories',
            ),
            BottomNavigationBarItem(
              icon:       Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label:      'Account',
            ),
            BottomNavigationBarItem(
              icon:       Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart_rounded),
              label:      'My Cart',
            ),
            BottomNavigationBarItem(
              icon:       Icon(Icons.menu_rounded),
              activeIcon: Icon(Icons.menu_rounded),
              label:      'More',
            ),
          ],
        ),
      ),
    );
  }
}
