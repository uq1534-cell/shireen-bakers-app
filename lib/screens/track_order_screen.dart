import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../models/order.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  // Sample order for demonstration
  late final Order _sampleOrder;

  @override
  void initState() {
    super.initState();

    // Create sample products
    final product1 = Product(
      id: 'p1',
      name: 'Chocolate Cake',
      categoryId: 'cakes',
      price: 1500,
      imageUrl: 'assets/images/cakehtml.jpg',
      description: 'Rich chocolate cake',
      weight: 1000,
    );

    final product2 = Product(
      id: 'p2',
      name: 'Fresh Cream Pastry',
      categoryId: 'pastries',
      price: 150,
      imageUrl: 'assets/images/moussepastry.jpg',
      description: 'Fresh pastry with cream',
      weight: 100,
    );

    // Create sample cart items
    final items = [
      CartItem(product: product1, quantity: 1),
      CartItem(product: product2, quantity: 4),
    ];

    // Create sample order
    _sampleOrder = Order(
      id: 'ORD-2025-001',
      items: items,
      total: 2100,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      status: OrderStatus.outForDelivery,
      deliveryAddress: '123 Main Street, Rawalpindi',
    );
  }

  final List<TrackingStep> _trackingSteps = [
    TrackingStep(
      title: 'Order Confirmed',
      icon: Icons.check_circle,
      isCompleted: true,
      timestamp: 'Today, 2:00 PM',
    ),
    TrackingStep(
      title: 'Preparing',
      icon: Icons.local_shipping,
      isCompleted: true,
      timestamp: 'Today, 2:30 PM',
    ),
    TrackingStep(
      title: 'Dispatched',
      icon: Icons.inventory_2,
      isCompleted: true,
      timestamp: 'Today, 3:00 PM',
    ),
    TrackingStep(
      title: 'On The Way',
      icon: Icons.directions_car,
      isCompleted: true,
      timestamp: 'Today, 3:45 PM',
      isActive: true,
    ),
    TrackingStep(
      title: 'Delivered',
      icon: Icons.home,
      isCompleted: false,
      timestamp: 'Est. Today, 4:30 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Order'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Header Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order ID',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _sampleOrder.id,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.success,
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            'Processing',
                            style: TextStyle(
                              color: AppColors.success,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Ordered on: Today, 2:00 PM',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Timeline Section
            Text(
              'Delivery Progress',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 20),

            // Timeline Steps
            _buildTimeline(),

            const SizedBox(height: 24),

            // Order Items
            Text(
              'Order Items',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            ..._sampleOrder.items.map((item) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Qty: ${item.quantity}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Rs. ${item.product.price}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 16),

            // Delivery Address
            Text(
              'Delivery Address',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _sampleOrder.deliveryAddress,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Contact Support Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Contacting support...'),
                    ),
                  );
                },
                child: const Text('Contact Support'),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: List.generate(
        _trackingSteps.length,
        (index) {
          final step = _trackingSteps[index];
          final isLast = index == _trackingSteps.length - 1;

          return SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline Dot and Line
                Column(
                  children: [
                    // Dot
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: step.isCompleted
                            ? AppColors.success
                            : (step.isActive
                                ? AppColors.accent
                                : AppColors.border),
                        boxShadow: step.isActive
                            ? [
                                BoxShadow(
                                  color: AppColors.accent.withOpacity(0.3),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                ),
                              ]
                            : [],
                      ),
                      child: Center(
                        child: Icon(
                          step.icon,
                          color: step.isCompleted || step.isActive
                              ? Colors.white
                              : AppColors.textLight,
                          size: 20,
                        ),
                      ),
                    ),
                    // Vertical Line
                    if (!isLast)
                      Container(
                        height: 60,
                        width: 2,
                        color: step.isCompleted
                            ? AppColors.success
                            : AppColors.border,
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                // Step Info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: step.isCompleted || step.isActive
                                        ? AppColors.textDark
                                        : AppColors.textLight,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step.timestamp,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TrackingStep {
  final String title;
  final IconData icon;
  final bool isCompleted;
  final bool isActive;
  final String timestamp;

  TrackingStep({
    required this.title,
    required this.icon,
    required this.isCompleted,
    this.isActive = false,
    required this.timestamp,
  });
}
