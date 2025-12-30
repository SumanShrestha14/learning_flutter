import 'package:first_app/pages/providers/ThemeProvider.dart';
import 'package:first_app/pages/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.wb_sunny
                  : Icons.nightlight_round,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: userProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : userProvider.users.isEmpty
          ? Center(
              child: ElevatedButton(
                child: const Text("Fetch Users"),
                onPressed: () => userProvider.fetchUsers(),
              ),
            )
          : ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    leading: CircleAvatar(child: Text(user.name[0])),
                  ),
                );
              },
            ),
    );
  }
}
