import 'package:flutter/material.dart';


class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms & Conditions')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms & Conditions',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Last Updated: 2025',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '1. Acceptance of Terms',
              'By accessing and using this mobile application, you accept and agree to be bound by the terms and provision of this agreement.',
            ),
            _buildSection(
              context,
              '2. Use License',
              'Permission is granted to temporarily download one copy of the materials for personal, non-commercial transitory viewing only.',
            ),
            _buildSection(
              context,
              '3. Disclaimer',
              'The materials on Shireen Bakers app are provided on an \'as is\' basis. Shireen Bakers makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
            ),
            _buildSection(
              context,
              '4. Limitations',
              'In no event shall Shireen Bakers or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on Shireen Bakers.',
            ),
            _buildSection(
              context,
              '5. Accuracy of Materials',
              'The materials appearing on Shireen Bakers mobile app could include technical, typographical, or photographic errors. Shireen Bakers does not warrant that any of the materials on this app are accurate, complete, or current.',
            ),
            _buildSection(
              context,
              '6. Links',
              'Shireen Bakers has not reviewed all of the sites linked to its mobile app and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Shireen Bakers of the site.',
            ),
            _buildSection(
              context,
              '7. Modifications',
              'Shireen Bakers may revise these terms of service for this app at any time without notice. By using this app, you are agreeing to be bound by the then current version of these terms of service.',
            ),
            _buildSection(
              context,
              '8. Governing Law',
              'These terms and conditions are governed by and construed in accordance with the laws of Pakistan and you irrevocably submit to the exclusive jurisdiction of the courts located in Rawalpindi.',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
