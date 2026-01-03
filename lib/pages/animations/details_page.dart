import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int itemIndex;
  const DetailPage({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details $itemIndex")),
      body: Center(
        child: Hero(
          tag: "card$itemIndex",
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Card Details $itemIndex",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
