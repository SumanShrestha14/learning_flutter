import 'package:first_app/pages/local_storage/HomePage.dart';
import 'package:first_app/pages/local_storage/LocalStorage.dart';
import 'package:first_app/pages/local_storage/LoginPage.dart';
import 'package:first_app/pages/local_storage/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isLoggedIn = await LocalStorage.getLogin();
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => ThemeProvider()),
    //     ChangeNotifierProvider(create: (_) => UserProvider()),
    //   ],
    //   child: const MyApp(),
    // ),
    ChangeNotifierProvider(
      create: (_) => ThemeProvider()..loadTheme(),
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'Users + Theme Demo',
      // theme: ThemeData.light().copyWith(
      //   primaryColor: Colors.blue,
      //   appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      // ),
      // darkTheme: ThemeData.dark().copyWith(
      //   primaryColor: Colors.teal,
      //   appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
      // ),
      // themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // home: const UserPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
