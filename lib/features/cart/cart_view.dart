import 'package:flutter/material.dart';

// Cart page widget
class CartView extends StatefulWidget {
  final List<Map<String, dynamic>> cart; // List of products in cart
  final Map<String, int> cartQuantities; // Quantity of each product

  const CartView({super.key, required this.cart, required this.cartQuantities});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  // Calculate total price of cart items
  double get totalPrice {
    double total = 0;
    for (var product in widget.cart) {
      final priceString =
          product['price'] as String; // Get product price string
      final price = double.tryParse(
              priceString.replaceAll(',', '').replaceAll(' SAR', '')) ??
          0; // Convert price to double
      final quantity =
          widget.cartQuantities[product['name']] ?? 1; // Get quantity
      total += price * quantity; // Add to total
    }
    return total;
  }

  // Increase product quantity
  void increaseQuantity(String name) {
    setState(() {
      widget.cartQuantities[name] = (widget.cartQuantities[name] ?? 1) + 1;
    });
  }

  // Decrease product quantity
  void decreaseQuantity(String name) {
    setState(() {
      if ((widget.cartQuantities[name] ?? 1) > 1) {
        widget.cartQuantities[name] = (widget.cartQuantities[name] ?? 1) - 1;
      } else {
        removeFromCart(name); // Remove product if quantity reaches 0
      }
    });
  }

  // Remove product from cart
  void removeFromCart(String name) {
    setState(() {
      widget.cart.removeWhere((item) => item['name'] == name);
      widget.cartQuantities.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Page background color

      // AppBar with title
      appBar: AppBar(
        title: const Text("Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // Body content
      body: widget.cart.isEmpty
          ? const Center(
              child: Text("Your cart is empty!",
                  style: TextStyle(fontSize: 18))) // Empty cart message
          : Padding(
              padding: const EdgeInsets.all(16.0), // Page padding
              child: Column(
                children: [
                  // List of products
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.cart.length, // Number of products
                      itemBuilder: (context, index) {
                        final product = widget.cart[index]; // Current product
                        final quantity =
                            widget.cartQuantities[product['name']] ??
                                1; // Current quantity

                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8), // Card margin
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

                                // Product info and controls
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Product name
                                      Text(product['name'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 8),

                                      // Product price
                                      Text(product['price'],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      const SizedBox(height: 12),

                                      // Quantity and delete row
                                      Row(
                                        children: [
                                          // Decrease quantity button
                                          _transparentButton(
                                            icon: Icons.remove,
                                            onTap: () => decreaseQuantity(
                                                product['name']),
                                          ),

                                          // Quantity display
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              quantity.toString(),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),

                                          // Increase quantity button
                                          _transparentButton(
                                            icon: Icons.add,
                                            onTap: () => increaseQuantity(
                                                product['name']),
                                          ),

                                          const Spacer(), // Push delete button to end

                                          // Delete product button
                                          GestureDetector(
                                            onTap: () =>
                                                removeFromCart(product['name']),
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFEF2A39),
                                                  width: 1.3,
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: Color(0xFFEF2A39),
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12), // Space before total

                  // Total price container
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 199, 199),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 216, 216, 216)
                                .withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5))
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold)), // Label
                        Text(
                          "${totalPrice.toStringAsFixed(2)} SAR", // Total amount
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16), // Space before checkout button

                  // Checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {}, // Action on press
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(
                            255, 255, 152, 0), // Add to Cart color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Checkout",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Transparent button widget for increase/decrease
  Widget _transparentButton({
    required IconData icon, // Icon to display
    required Function() onTap, // Action on tap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25, // Button width
        height: 25, // Button height
        decoration: BoxDecoration(
          color:
              Colors.black.withOpacity(0.03), // Slight transparent background
          borderRadius: BorderRadius.circular(6), // Rounded corners
          border: Border.all(
            color: const Color(0xFF292D32), // Border color
            width: 1.2, // Border width
          ),
        ),
        child: Icon(
          icon,
          size: 16, // Icon size
          color: const Color(0xFF292D32), // Icon color
        ),
      ),
    );
  }
}
