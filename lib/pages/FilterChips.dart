import 'package:flutter/material.dart';

class Filterchips extends StatelessWidget {
  const Filterchips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          FilterChip(
            label: const Text("All"),
            selected: true,
            onSelected: (bool value) {},
            backgroundColor: Colors.white,
            selectedColor: Colors.deepPurple,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text("Electronics"),
            selected: false,
            onSelected: (bool value) {},
            backgroundColor: Colors.white,
            selectedColor: Colors.deepPurple,
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text("Accessories"),
            selected: false,
            onSelected: (bool value) {},
            backgroundColor: Colors.white,
            selectedColor: Colors.deepPurple,
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text("Under ₹5000"),
            selected: false,
            onSelected: (bool value) {},
            backgroundColor: Colors.white,
            selectedColor: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
