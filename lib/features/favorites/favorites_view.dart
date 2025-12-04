import 'package:flutter/material.dart';

// Favorites page widget
class FavoritesView extends StatefulWidget {
  final List<Map<String, dynamic>> favorites; // List of favorite products

  const FavoritesView({super.key, required this.favorites});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  // Remove product from favorites
  void removeFromFavorites(String name) {
    setState(() {
      widget.favorites.removeWhere((item) => item['name'] == name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Page background color

      // AppBar with title
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // Body content
      body: widget.favorites.isEmpty
          ? const Center(
              child: Text(
                "Your favorites list is empty!", // Empty favorites message
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0), // Page padding
              child: ListView.builder(
                itemCount:
                    widget.favorites.length, // Number of favorite products
                itemBuilder: (context, index) {
                  final product = widget.favorites[index]; // Current product
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8), // Card margin
                    elevation: 1, // Card shadow
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12)), // Rounded corners
                    child: Padding(
                      padding: const EdgeInsets.all(12.0), // Card padding
                      child: Row(
                        children: [
                          // Product image container
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200],
                              image: DecorationImage(
                                image: AssetImage(product['image']),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: 16), // Space between image and info

                          // Product information
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product name
                                Text(
                                  product['name'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                // Product price
                                Text(
                                  product['price'],
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),

                          // Delete button
                          GestureDetector(
                            onTap: () => removeFromFavorites(product['name']),
                            child: Container(
                              width: 25, // Button width
                              height: 25, // Button height
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(6), // Rounded corners
                                border: Border.all(
                                  color: const Color(
                                      0xFFEF2A39), // Same color as cart delete
                                  width: 1.3,
                                ),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Color(0xFFEF2A39), // Delete icon color
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
