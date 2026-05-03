import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/account_screen.dart';
import '../screens/track_order_screen.dart';
import '../screens/about_screen.dart';
import '../screens/store_locator_screen.dart';
import '../screens/login_screen.dart';
import '../screens/product_detail_screen.dart';

class AppRoutes {
  static const home = '/';
  static const categories = '/categories';
  static const productDetail = '/product-detail';
  static const cart = '/cart';
  static const account = '/account';
  static const login = '/login';
  static const trackOrder = '/track-order';
  static const about = '/about';
  static const storeLocator = '/store-locator';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    categories: (_) => const CategoriesScreen(),
    cart: (_) => const CartScreen(),
    account: (_) => const AccountScreen(),
    login: (_) => const LoginScreen(),
    trackOrder: (_) => const TrackOrderScreen(),
    about: (_) => const AboutScreen(),
    storeLocator: (_) => const StoreLocatorScreen(),
  };

  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == productDetail) {
      final productId = settings.arguments as String? ?? '';
      return MaterialPageRoute(
        builder: (_) => ProductDetailScreen(productId: productId),
        settings: settings,
      );
    }
    return null;
  }
}
