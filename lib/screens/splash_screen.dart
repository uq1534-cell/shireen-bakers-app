import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/app_colors.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    // Allow the splash UI to render before doing async work
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    // Restore Supabase session (no-op when no active session)
    final auth = context.read<AuthProvider>();
    await auth.initializeSession();
    if (!mounted) return;

    // If a session was restored, load the user's cart
    if (auth.isLoggedIn) {
      await context.read<CartProvider>().loadFromSupabase();
    }

    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              child: Image.asset(
                'assets/images/logo_transparent.png',
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Shireen Bakers',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Premium Bakery Experience',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 60),
          const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }
}
