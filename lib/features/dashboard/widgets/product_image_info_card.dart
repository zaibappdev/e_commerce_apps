import 'package:flutter/material.dart';

class ProductImageInfoCard extends StatelessWidget {
  final Map<String, String> product;
  final double width;

  const ProductImageInfoCard({
    super.key,
    required this.product,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product['img'] ?? '',
              width: width,
              height: width * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product['name'] ?? '',
                style: const TextStyle(
                  fontFamily: 'MediumFont',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                product['price'] ?? '',
                style: const TextStyle(
                  fontFamily: 'MediumFont',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Product Category',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '${product['subPrice'] ?? ''} discount',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
