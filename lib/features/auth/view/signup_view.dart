import 'package:flutter/material.dart'; // Import Flutter material package
import 'package:projact_first/features/home/home_view.dart'; // Import Home page
import 'login_view.dart'; // Import Login page

// Sign Up page widget
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState(); // Create state
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController =
      TextEditingController(); // Name input controller
  final TextEditingController emailController =
      TextEditingController(); // Email input controller
  final TextEditingController passwordController =
      TextEditingController(); // Password input controller
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  bool _obscurePassword = true; // Password visibility toggle

  // Sign up function
  void _signUp() {
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
            padding: const EdgeInsets.all(24.0), // Page padding
            child: Form(
              key: _formKey, // Assign form key
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimal column size
                children: [
                  // Logo and store name
                  Column(
                    children: [
                      Image.asset(
                        'img/logott.png', // Store logo
                        width: 350,
                        height: 180,
                      ),
                      const SizedBox(height: 1), // Small spacing
                      const Text(
                        "Thara Store", // Store name
                        style: TextStyle(
                          color: Color(0xFF1E2A38),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35), // Spacing

                  // Name input field
                  TextFormField(
                    controller: nameController, // Connect controller
                    style: const TextStyle(color: Colors.black), // Text style
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100, // Field background
                      hintText: "Full Name", // Placeholder
                      prefixIcon: const Icon(Icons.person,
                          color: Colors.black54), // Prefix icon
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Rounded corners
                        borderSide: BorderSide.none, // No border
                      ),
                    ),
                    validator: (value) {
                      // Validation
                      if (value == null || value.isEmpty) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16), // Spacing

                  // Email input field
                  TextFormField(
                    controller: emailController, // Connect controller
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email,
                          color: Colors.black54), // Prefix icon
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType:
                        TextInputType.emailAddress, // Email input type
                    validator: (value) {
                      // Validation
                      if (value == null || value.isEmpty) {
                        return 'Enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16), // Spacing

                  // Password input field
                  TextFormField(
                    controller: passwordController, // Connect controller
                    style: const TextStyle(color: Colors.black),
                    obscureText: _obscurePassword, // Obscure password
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock,
                          color: Colors.black54), // Prefix icon
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off, // Toggle icon
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword =
                                !_obscurePassword; // Toggle visibility
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      // Validation
                      if (value == null || value.isEmpty) {
                        return 'Enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24), // Spacing

                  // Sign Up button
                  SizedBox(
                    width: double.infinity, // Full width
                    height: 55, // Button height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF1E2A38), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // Rounded corners
                        ),
                        elevation: 4, // Shadow
                      ),
                      onPressed: _signUp, // On press function
                      child: const Text(
                        "Sign Up", // Button text
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Spacing

                  // Login link
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const LoginView()), // Navigate to login
                      );
                    },
                    child: const Text(
                      "Already have an account? Login", // Text
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
