import 'package:first_app/pages/local_storage/LocalStorage.dart';
import 'package:first_app/pages/local_storage/LoginPage.dart';
import 'package:first_app/pages/local_storage/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
          onPressed: () async {
            await LocalStorage.saveLogin(false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          },
        ),
      ),
    );
  }
}
