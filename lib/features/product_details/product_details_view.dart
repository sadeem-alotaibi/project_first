import 'package:flutter/material.dart'; // Import Flutter material package

// Product details page widget
class ProductDetailsView extends StatelessWidget {
  final String name; // Product name
  final String type; // Product type/category
  final String price; // Product price
  final String image; // Product image path

  // Optional callbacks for HomeView
  final VoidCallback? addToFavorites; // Add to favorites callback
  final VoidCallback? addToCart; // Add to cart callback

  const ProductDetailsView({
    super.key,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    this.addToFavorites,
    this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"), // AppBar title
        backgroundColor:
            const Color.fromARGB(255, 253, 253, 252), // AppBar color
        iconTheme: const IconThemeData(color: Colors.black), // Back icon color
        elevation: 0, // Remove shadow
      ),

      // Scrollable content for long pages
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20), // Page padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Center(child: Image.asset(image, height: 250, fit: BoxFit.contain)),
            const SizedBox(height: 20), // Spacing

            // Product name
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // Spacing

            // Product type
            Text(
              type,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 25), // Spacing

            // Product price
            Text(
              price,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30), // Spacing

            // Buttons for favorites and cart
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      addToFavorites?.call(); // Call addToFavorites

                      // Show single SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: const [
                              Icon(Icons.favorite, color: Colors.white),
                              SizedBox(width: 8),
                              Expanded(child: Text("Added to Favorites")),
                            ],
                          ),
                          backgroundColor: Colors.redAccent, // SnackBar color
                          behavior: SnackBarBehavior.floating, // Floating style
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.all(16), // Margin
                          duration: Duration(seconds: 2), // Duration
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite), // Button icon
                    label: const Text("Add to Favorites"), // Button label
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent, // Button color
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Spacing
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      addToCart?.call(); // Call addToCart

                      // Show single SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: const [
                              Icon(Icons.shopping_cart, color: Colors.white),
                              SizedBox(width: 8),
                              Expanded(child: Text("Added to Cart")),
                            ],
                          ),
                          backgroundColor: Colors.orange, // SnackBar color
                          behavior: SnackBarBehavior.floating, // Floating style
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.all(16), // Margin
                          duration: Duration(seconds: 2), // Duration
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart), // Button icon
                    label: const Text("Add to Cart"), // Button label
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20), // Spacing

            // Product overview title
            const Text(
              "Product Overview",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8), // Spacing

            // Product description
            const Text(
              "Specifications: Item number /642538, Manufacturer /MXVG3AHA, Capacity /GB, Screen size /6.7 inch, Rear Camera Resolution /48MP + 12MP, Front Camera /12MP, Special Camera Features /2x zoom, Night Mode, 4K, Slow-motion video",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
