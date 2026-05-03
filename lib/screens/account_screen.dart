import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: auth.isLoggedIn
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, ${auth.user.name}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text('Email: ${auth.user.email}'),
                  Text('Phone: ${auth.user.phone}'),
                  Text('Address: ${auth.user.address}'),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: auth.logout,
                    child: const Text('Logout'),
                  ),
                ],
              )
            : Center(
                child: ElevatedButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Login'),
                ),
              ),
      ),
    );
  }
}
