import 'package:flutter/material.dart';

class DashboardSliderCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final int currentIndexPage;
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  const DashboardSliderCarousel({
    super.key,
    required this.imageUrls,
    required this.currentIndexPage,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: PageView.builder(
        itemCount: imageUrls.length,
        controller: controller,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          final isCurrentPage = index == currentIndexPage;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(
              horizontal: isCurrentPage ? 4 : 12,
              vertical: isCurrentPage ? 0 : 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                if (isCurrentPage)
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: imageUrls[index].isNotEmpty
                  ? Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : const Center(
                      child: Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
            ),
          );
        },
      ),
    );
  }
}
