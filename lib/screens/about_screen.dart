import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Shireen Bakers is a local bakery app for Rawalpindi and Islamabad. Browse cakes, breads, and pastries with easy ordering and order tracking.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
