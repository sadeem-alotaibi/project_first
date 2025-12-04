import 'package:flutter/material.dart'; // Import Flutter material package
import 'package:projact_first/features/home/home_view.dart'; // Import Home page
import 'signup_view.dart'; // Import Sign Up page

// Login page widget
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState(); // Create state
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController =
      TextEditingController(); // Email input controller
  final TextEditingController passwordController =
      TextEditingController(); // Password input controller
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  bool _obscurePassword = true; // Password visibility toggle

  // Login function
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Validate form
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => const HomeView()), // Navigate to Home page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Page background color
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: 24), // Page horizontal padding
            child: Form(
              key: _formKey, // Assign form key
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimal column size
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center align children
                children: [
                  // Logo and store name
                  Column(
                    children: [
                      Image.asset(
                        "img/logott.png", // Store logo
                        width: 350, // Logo width
                        height: 180, // Logo height
                        fit: BoxFit.contain, // Fit image
                      ),
                      const SizedBox(height: 1), // Small spacing
                      const Text(
                        "Thara Store", // Store name
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E2A38),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35), // Spacing

                  // Email input field
                  TextFormField(
                    controller: emailController, // Connect controller
                    decoration: InputDecoration(
                      hintText: "Email", // Placeholder text
                      filled: true,
                      fillColor: Colors.grey.shade100, // Field background color
                      prefixIcon: const Icon(Icons.email), // Prefix icon
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Rounded corners
                        borderSide: BorderSide.none, // No border
                      ),
                    ),
                    validator: (value) => value!.isEmpty
                        ? "Enter your email"
                        : null, // Validation
                  ),
                  const SizedBox(height: 16), // Spacing

                  // Password input field
                  TextFormField(
                    controller: passwordController, // Connect controller
                    obscureText: _obscurePassword, // Obscure password
                    decoration: InputDecoration(
                      hintText: "Password", // Placeholder text
                      filled: true,
                      fillColor: Colors.grey.shade100, // Field background color
                      prefixIcon: const Icon(Icons.lock), // Prefix icon
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off, // Toggle icon
                        ),
                        onPressed: () => setState(() => _obscurePassword =
                            !_obscurePassword), // Toggle visibility
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Rounded corners
                        borderSide: BorderSide.none, // No border
                      ),
                    ),
                    validator: (value) => value!.length < 6
                        ? "Password too short"
                        : null, // Validation
                  ),
                  const SizedBox(height: 24), // Spacing

                  // Login button
                  SizedBox(
                    width: double.infinity, // Full width
                    height: 55, // Button height
                    child: ElevatedButton(
                      onPressed: _login, // On press function
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF1E2A38), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // Rounded corners
                        ),
                        elevation: 4, // Shadow
                      ),
                      child: const Text(
                        "Login", // Button text
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Spacing

                  // Sign Up link
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const SignUpView()), // Navigate to Sign Up page
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign Up", // Text
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
