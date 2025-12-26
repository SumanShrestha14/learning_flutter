import 'package:first_app/pages/DashboardScreen.dart';
import 'package:first_app/pages/FilterChips.dart';
import 'package:first_app/pages/ProductGrid.dart';
import 'package:first_app/pages/ProfileScreen.dart';
import 'package:first_app/pages/SummarySection.dart';
import 'package:flutter/material.dart';

// -------------------- PRODUCT LIST PAGE --------------------

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            },
            icon: const Icon(Icons.dashboard),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        children: [
          // Summary Card
          Summarysection(),
          // Filter Chips
          Filterchips(),
          const SizedBox(height: 16),
          // Products Grid - Fixed overflow issue
          Productgrid(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
