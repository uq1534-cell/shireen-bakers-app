import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/account_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/about_screen.dart';
import 'bottom_nav_bar.dart';

/// Root shell that owns the persistent [BottomNavBar] and keeps all
/// main-tab screens alive via [IndexedStack].
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  void _switchTab(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Pass switchTab so the home header cart icon can jump to Cart tab
          HomeScreen(onSwitchTab: _switchTab),
          const CategoriesScreen(),
          const AccountScreen(),
          const CartScreen(),
          const AboutScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _switchTab,
      ),
    );
  }
}
