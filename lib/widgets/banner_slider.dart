import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView(
        children: [
          _buildSlide(context, 'Fresh cakes delivered today', Colors.orange),
          _buildSlide(context, 'Bread baked daily', Colors.brown),
          _buildSlide(context, 'Special pastry offers', Colors.pink),
        ],
      ),
    );
  }

  Widget _buildSlide(BuildContext context, String title, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white)),
      ),
    );
  }
}
