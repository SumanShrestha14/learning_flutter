import 'package:first_app/pages/ActivityCard.dart';
import 'package:first_app/pages/ProductList.dart';
import 'package:first_app/pages/ProfileScreen.dart';
import 'package:first_app/pages/statCard.dart';
import 'package:flutter/material.dart';

/// Dashboard Screen demonstrating:
/// - Row, Column, Expanded, Flexible
/// - Padding, Margin, SizedBox
/// - Container vs Card
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          // Main column containing all dashboard sections
          children: [
            // HEADER SECTION - Using Row with spacing
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // Row: arranges children horizontally
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title on the left
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 4,
                      ), // SizedBox for vertical spacing
                      Text(
                        'Here\'s your overview',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  // Action button on the right
                  Container(
                    // Container: for custom styling (decoration, constraints)
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.notifications_outlined),
                  ),
                ],
              ),
            ),

            // STATS ROW - Demonstrating Expanded
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Expanded: takes available space equally
                  Expanded(
                    child: StatCard(
                      title: 'Revenue',
                      value: 'Rs.12.5K',
                      icon: Icons.trending_up,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12), // SizedBox for horizontal spacing
                  Expanded(
                    child: StatCard(
                      title: 'Users',
                      value: '1.2K',
                      icon: Icons.people,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      title: 'Orders',
                      value: '89',
                      icon: Icons.shopping_cart,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16), // Vertical spacing between sections
            // MAIN CONTENT - Demonstrating Flexible
            Expanded(
              // Expanded: takes remaining vertical space
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section title with margin
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      // margin: space outside the widget
                      child: Text(
                        'Recent Activity',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Activity Cards - Demonstrating Card widget
                    ActivityCard(
                      title: 'New Order Received',
                      subtitle: 'Order #1234 from John Doe',
                      time: '2 hours ago',
                      icon: Icons.shopping_bag,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 12),
                    ActivityCard(
                      title: 'Payment Processed',
                      subtitle: 'Rs.450.00 payment received',
                      time: '5 hours ago',
                      icon: Icons.payment,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 12),
                    ActivityCard(
                      title: 'Customer Review',
                      subtitle: '5-star review from Sarah',
                      time: '1 day ago',
                      icon: Icons.star,
                      color: Colors.orange,
                    ),

                    const SizedBox(height: 24),

                    // Container vs Card comparison section
                    Text(
                      'Container vs Card',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Container example - more flexible, manual styling
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      // padding: space inside the widget
                      margin: const EdgeInsets.only(bottom: 12),
                      // margin: space outside the widget
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.purple.shade200),
                      ),
                      child: const Text(
                        'Container: Full control over decoration, no elevation',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),

                    // Card example - Material Design, built-in elevation
                    Card(
                      elevation: 2,
                      // Card has built-in elevation (shadow)
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Card: Material Design, automatic elevation & styling',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

                    // Flexible example - takes space but doesn't force it
                    Row(
                      children: [
                        Flexible(
                          // Flexible: can be smaller than available space
                          flex: 2,
                          child: Container(
                            height: 60,
                            color: Colors.red.shade100,
                            child: const Center(
                              child: Text('Flexible (flex: 2)'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 60,
                            color: Colors.blue.shade100,
                            child: const Center(
                              child: Text('Flexible (flex: 1)'),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // BOTTOM NAVIGATION - Row with icons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', true),
                  _buildNavItem(Icons.search, 'Search', false),
                  _buildNavItem(Icons.favorite, 'Favorites', false),
                  _buildNavItem(Icons.person, 'Profile', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? Colors.blue : Colors.grey),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }
}
