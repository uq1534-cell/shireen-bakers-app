import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/account_screen.dart';
import '../screens/track_order_screen.dart';
import '../screens/about_screen.dart';
import '../screens/store_locator_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/terms_screen.dart';
import '../screens/privacy_policy_screen.dart';
import '../screens/contact_us_screen.dart';
import '../screens/feedback_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const home = '/';
  static const categories = '/categories';
  static const productDetail = '/product-detail';
  static const cart = '/cart';
  static const account = '/account';
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgot-password';
  static const trackOrder = '/track-order';
  static const about = '/about';
  static const storeLocator = '/store-locator';
  static const terms = '/terms';
  static const privacy = '/privacy';
  static const contact = '/contact';
  static const feedback = '/feedback';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    home: (_) => const HomeScreen(),
    categories: (_) => const CategoriesScreen(),
    cart: (_) => const CartScreen(),
    account: (_) => const AccountScreen(),
    login: (_) => const LoginScreen(),
    signup: (_) => const SignupScreen(),
    forgotPassword: (_) => const ForgotPasswordScreen(),
    trackOrder: (_) => const TrackOrderScreen(),
    about: (_) => const AboutScreen(),
    storeLocator: (_) => const StoreLocatorScreen(),
    terms: (_) => const TermsScreen(),
    privacy: (_) => const PrivacyPolicyScreen(),
    contact: (_) => const ContactUsScreen(),
    feedback: (_) => const FeedbackScreen(),
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
