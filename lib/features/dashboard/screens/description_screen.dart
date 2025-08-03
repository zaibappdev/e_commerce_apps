import 'package:flutter/material.dart';

import '../widgets/product_image_info_card.dart';
import '../widgets/product_tab_bar.dart';
import '../widgets/product_tags_row.dart';

class DescriptionScreen extends StatefulWidget {
  final Map<String, String> product;

  const DescriptionScreen({super.key, required this.product});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top AppBar style title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: const Text(
                'Product Detail',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Product image and info
                    ProductImageInfoCard(product: product, width: width),

                    // Tab Bar
                    ProductTabBar(tabController: _tabController),

                    // Tab content
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This is the ${_tabController.index == 0
                                ? 'description'
                                : _tabController.index == 1
                                ? 'specification'
                                : 'additional info'} for ${product['name']}.',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(color: Colors.black12),
                          const SizedBox(height: 16),

                          // Inline tags/badges
                          ProductTagsRow(tags: ['Bags', 'Shoes', 'Packs']),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
