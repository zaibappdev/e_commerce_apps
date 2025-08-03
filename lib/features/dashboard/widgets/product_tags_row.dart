import 'package:flutter/material.dart';

class ProductTagsRow extends StatelessWidget {
  final List<String> tags;

  const ProductTagsRow({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tags
          .map(
            (tag) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Text(tag, style: const TextStyle(color: Colors.grey)),
              ),
            ),
          )
          .toList(),
    );
  }
}
