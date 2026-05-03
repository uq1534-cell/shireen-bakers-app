import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderStepTile extends StatelessWidget {
  final String title;
  final OrderStatus status;
  final bool isActive;

  const OrderStepTile(
      {super.key,
      required this.title,
      required this.status,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isActive ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isActive ? Theme.of(context).colorScheme.primary : Colors.grey,
      ),
      title: Text(title),
      subtitle: Text(status.name),
    );
  }
}
