import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/firebase_options.dart';
import 'package:first_app/pages/animations/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  // For Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // For Local Storage
  // WidgetsFlutterBinding.ensureInitialized();
  // final isLoggedIn = await LocalStorage.getLogin();
  // runApp(
  //Learning Statemanagement
  // MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(create: (_) => ThemeProvider()),
  //     ChangeNotifierProvider(create: (_) => UserProvider()),
  //   ],
  //   child: const MyApp(),
  // ),
  //Learning local storage
  // ChangeNotifierProvider(
  //   create: (_) => ThemeProvider()..loadTheme(),
  //   child: MyApp(isLoggedIn: isLoggedIn),
  // ),
  // );
  //Learning Firebase
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   final bool isLoggedIn;
//   const MyApp({super.key, required this.isLoggedIn});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = context.watch<ThemeProvider>();

//     return MaterialApp(
//       // debugShowCheckedModeBanner: false,
//       // title: 'Users + Theme Demo',
//       // theme: ThemeData.light().copyWith(
//       //   primaryColor: Colors.blue,
//       //   appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
//       // ),
//       // darkTheme: ThemeData.dark().copyWith(
//       //   primaryColor: Colors.teal,
//       //   appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
//       // ),
//       // themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
//       // home: const UserPage(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: themeProvider.themeMode,
//       home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animations",
      home: HomePage(),
    );
  }
}
