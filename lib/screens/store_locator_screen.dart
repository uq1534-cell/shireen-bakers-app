import 'package:flutter/material.dart';
import '../data/dummy_stores.dart';
import '../widgets/store_card.dart';

class StoreLocatorScreen extends StatelessWidget {
  const StoreLocatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Store Locator')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyStores.length,
        itemBuilder: (context, index) {
          return StoreCard(store: dummyStores[index]);
        },
      ),
    );
  }
}
