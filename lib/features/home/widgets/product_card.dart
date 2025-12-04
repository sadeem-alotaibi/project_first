import 'package:flutter/material.dart'; // Import Flutter material package
import 'package:flutter_svg/flutter_svg.dart'; // Import SVG support

// Product card widget for grid display
class ProductCard extends StatelessWidget {
  final String name; // Product name
  final String type; // Product type/category
  final String price; // Product price
  final String image; // Product image path
  final bool isSvg; // Check if image is SVG
  final VoidCallback onTap; // Callback when card is tapped

  const ProductCard({
    super.key,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    this.isSvg = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to product details on tap
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100, // Card background color
          borderRadius: BorderRadius.circular(16), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              blurRadius: 6, // Shadow blur
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Image background
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16)), // Top corners
                ),
                child: isSvg
                    ? SvgPicture.asset(image,
                        fit: BoxFit.contain) // Display SVG
                    : Image.asset(image,
                        fit: BoxFit.cover), // Display normal image
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // Content padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name, // Product name text
                    style: const TextStyle(
                        color: Color(0xFF1E2A38), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    type, // Product type text
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4), // Spacing
                  Text(
                    price, // Product price text
                    style: const TextStyle(
                        color: Color(0xFF1E2A38), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
