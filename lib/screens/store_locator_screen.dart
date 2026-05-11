import 'package:flutter/material.dart';
import '../data/dummy_stores.dart';
import '../widgets/store_card.dart';

class StoreLocatorScreen extends StatelessWidget {
  const StoreLocatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Store Locator'),
        elevation: 0,
      ),
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
