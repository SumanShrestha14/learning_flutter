import 'package:first_app/pages/providers/ThemeProvider.dart';
import 'package:first_app/pages/providers/UserPage.dart';
import 'package:first_app/pages/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users + Theme Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const UserPage(),
    );
  }
}
