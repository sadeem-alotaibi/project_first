import 'package:flutter/material.dart'; // Flutter material package import
import 'package:carousel_slider/carousel_slider.dart'; // Carousel slider import
import 'package:projact_first/features/product_details/product_details_view.dart'; // Product details page import
import 'widgets/product_card.dart'; // Product card widget import

// Import favorites, cart, and profile pages
import '../favorites/favorites_view.dart';
import '../cart/cart_view.dart';
import '../profile/profile_view.dart';

// Home page widget
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0; // Selected index for bottom navigation

  List<Map<String, dynamic>> favorites = []; // Favorites list
  List<Map<String, dynamic>> cart = []; // Cart list
  Map<String, int> cartQuantities = {}; // Quantity of each product in cart

  // Add product to favorites
  void addToFavorites(Map<String, dynamic> product) {
    setState(() {
      if (!favorites.contains(product)) favorites.add(product);
    });
  }

  // Add product to cart
  void addToCart(Map<String, dynamic> product) {
    setState(() {
      if (!cart.contains(product)) {
        cart.add(product); // Add first time
        cartQuantities[product['name']] = 1;
      } else {
        cartQuantities[product['name']] =
            (cartQuantities[product['name']] ?? 1) + 1; // Increase quantity
      }
    });
  }

  String selectedCategory = "All"; // Selected category

  final List<String> sliderImages = [
    "img/iphone17.png",
    "img/hand.png"
  ]; // Slider images

  final List<String> categories = [
    "All",
    "Smartphones",
    "Computers",
    "Headphones",
    "Tablets",
    "Projectors",
    "Displays",
  ]; // Categories list

  final List<Map<String, dynamic>> products = [
    // Products list
    {
      "name": "TMA-2 HD Wireless",
      "image": "img/ssaaa.png",
      "type": "Headphones",
      "price": "599 SAR",
      "isSvg": false,
    },
    {
      "name": "iPhone 17 Pro Max",
      "image": "img/iPhone 17 Pro Max.png",
      "type": "Smartphones",
      "price": "5,499 SAR",
      "isSvg": false,
    },
    {
      "name": "iPhone 16",
      "image": "img/iphone.png",
      "type": "Smartphones",
      "price": "4,299 SAR",
      "isSvg": false,
    },
    {
      "name": "Headphones Wired",
      "image": "img/WiredHeadphones.png",
      "type": "Headphones",
      "price": "399 SAR",
      "isSvg": false,
    },
    {
      "name": "Headphones Wireless",
      "image": "img/WirelessHeadphones.png",
      "type": "Headphones",
      "price": "499 SAR",
      "isSvg": false,
    },
    {
      "name": "PlayStation 5",
      "image": "img/PlayStation5.png",
      "type": "Displays",
      "price": "2,099 SAR",
      "isSvg": false,
    },
    {
      "name": "HP Laptop 15",
      "image": "img/HPLaptop15.png",
      "type": "Computers",
      "price": "3,999 SAR",
      "isSvg": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter products by selected category
    List<Map<String, dynamic>> filteredProducts = selectedCategory == "All"
        ? products
        : products.where((p) => p['type'] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.white, // Page background color

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Thara Store", // App title
          style: TextStyle(
            color: Color(0xFF1E2A38),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Page content
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Page padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel slider
            CarouselSlider(
              items: sliderImages.map((path) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child:
                        Image.asset(path, fit: BoxFit.contain), // Slider image
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                  height: 230, autoPlay: true), // Slider options
            ),

            const SizedBox(height: 20), // Spacing

            // Search box
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search products...", // Search hint
                  prefixIcon: Icon(Icons.search), // Search icon
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),

            const SizedBox(height: 20), // Spacing

            // Categories title
            const Text("Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10), // Spacing

            // Horizontal categories list
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scroll
                itemCount: categories.length, // Number of categories
                itemBuilder: (context, i) {
                  final selected =
                      selectedCategory == categories[i]; // Check selected
                  return GestureDetector(
                    onTap: () => setState(() =>
                        selectedCategory = categories[i]), // Change category
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected
                            ? Colors.black
                            : Colors.grey.shade200, // Selected color
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        categories[i], // Category name
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : Colors.black, // Text color
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20), // Spacing

            // Products grid
            Expanded(
              child: GridView.builder(
                itemCount: filteredProducts.length, // Number of products
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Columns count
                  mainAxisSpacing: 16, // Vertical spacing
                  crossAxisSpacing: 16, // Horizontal spacing
                  childAspectRatio: .75, // Card aspect ratio
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index]; // Current product
                  return ProductCard(
                    name: product['name'], // Product name
                    type: product['type'], // Product type
                    price: product['price'], // Product price
                    image: product['image'], // Product image
                    isSvg: product['isSvg'], // Product is SVG

                    // Navigate to product details page
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsView(
                          name: product['name'],
                          type: product['type'],
                          price: product['price'],
                          image: product['image'],
                          addToFavorites: () => addToFavorites(product),
                          addToCart: () => addToCart(product),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Selected index
        selectedItemColor: const Color(0xFF1E2A38), // Selected color
        unselectedItemColor: Colors.grey, // Unselected color
        onTap: (index) {
          setState(() => _selectedIndex = index); // Update selected index

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FavoritesView(
                    favorites: favorites), // Navigate to favorites
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartView(
                  cart: cart, // Pass cart list
                  cartQuantities: cartQuantities, // Pass quantities
                ),
              ),
            );
          }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const ProfileView()), // Navigate to profile
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"), // Home tab
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Fav"), // Favorites tab
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"), // Cart tab
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"), // Profile tab
        ],
      ),
    );
  }
}
