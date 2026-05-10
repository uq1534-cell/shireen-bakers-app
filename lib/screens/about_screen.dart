import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EDD8),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'About Us',
          style: TextStyle(
            color:         Color(0xFF5A3E1B),
            fontWeight:    FontWeight.w800,
            fontSize:      18,
            letterSpacing: 0.4,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(height: 2, color: const Color(0xFFC8892A)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo and Company Name
            Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo_transparent.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Shireen Bakers',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Premium Bakery Experience',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // About Section
            Text(
              'About Shireen Bakers',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            Text(
              'Welcome to Shireen Bakers, your premier destination for freshly baked goods, delicious pastries, and premium bakery items. With a passion for quality and a commitment to excellence, we bring the finest flavors to your table.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            // Our Story
            Text(
              'Our Story',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 8),

            Text(
              'Founded with a vision to provide the best bakery experience in Rawalpindi, Shireen Bakers has been serving customers with premium quality baked goods for years. We use only the finest ingredients and traditional baking methods to ensure every product is fresh and delicious.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            // Why Choose Us
            Text(
              'Why Choose Us',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            _buildFeature(
              context,
              '🥐',
              'Fresh Daily',
              'All products are freshly baked every day using premium ingredients',
            ),
            _buildFeature(
              context,
              '⚡',
              'Fast Delivery',
              'Quick and reliable delivery service to your doorstep',
            ),
            _buildFeature(
              context,
              '💎',
              'Premium Quality',
              'We maintain the highest standards in all our products',
            ),
            _buildFeature(
              context,
              '🛍️',
              'Easy Ordering',
              'Simple and user-friendly mobile app for convenient ordering',
            ),

            const SizedBox(height: 24),

            // Locations
            Text(
              'Our Locations',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            _buildLocation(
              context,
              'Rawalpindi Branch',
              'Main Street, Rawalpindi',
              '+92-51-XXXXXXX',
            ),
            _buildLocation(
              context,
              'Islamabad Branch',
              'Blue Area, Islamabad',
              '+92-51-YYYYYYY',
            ),

            const SizedBox(height: 24),

            // Contact Section
            Text(
              'Get in Touch',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildContactIcon(
                  Icons.phone,
                  '+92-51-XXXXXXX',
                ),
                _buildContactIcon(
                  Icons.email,
                  'info@shireenbakers.com',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Version
            Center(
              child: Text(
                'Version 1.0.0',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(
    BuildContext context,
    String icon,
    String title,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocation(
    BuildContext context,
    String name,
    String address,
    String phone,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 18, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  address,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.phone_outlined,
                  size: 18, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                phone,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactIcon(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 120,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
