import 'package:flutter/material.dart';

class ProductTabBar extends StatelessWidget {
  final TabController tabController;

  const ProductTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        tabs: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('Description'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('Specification'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('More Info'),
          ),
        ],
        indicatorColor: Colors.deepPurple,
        labelColor: Colors.deepPurple,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }
}
