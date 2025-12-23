import 'package:flutter/material.dart';

// A screen with a Scaffold & SafeArea, showing a profile card
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade700,
      body: SafeArea(
        child: Center(
          child: ProfileCard(
            name: 'Jane Doe',
            jobTitle: 'Flutter Developer',
            phone: '+1 234 567 890',
            email: 'jane.doe@example.com',
          ),
        ),
      ),
    );
  }
}

// StatelessWidget because the card content doesn’t change at runtime
class ProfileCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String phone;
  final String email;

  const ProfileCard({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://tse1.mm.bing.net/th/id/OIP.gY3UuNfnbu5r4XXjrNNP_wHaLH?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3',
              ),
            ),
            const SizedBox(height: 16),
            // Name
            Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            // Job title
            Text(
              jobTitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade700,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            // Phone row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone, color: Colors.teal),
                const SizedBox(width: 8),
                Text(phone),
              ],
            ),
            const SizedBox(height: 8),
            // Email row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, color: Colors.teal),
                const SizedBox(width: 8),
                Text(email),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
