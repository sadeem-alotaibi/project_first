import 'package:flutter/material.dart'; // Import Flutter material package

// Profile page widget
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Page background color
      appBar: AppBar(
        title: const Text(
          "Profile", // AppBar title
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, // AppBar background color
        elevation: 0, // Remove shadow
        iconTheme: const IconThemeData(color: Colors.black), // Back icon color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // Page padding
        child: Column(
          children: [
            // Profile picture
            Center(
              child: CircleAvatar(
                radius: 55, // Circle radius
                backgroundColor: Colors.grey[300], // Placeholder color
                backgroundImage:
                    const AssetImage("img/profile.png"), // Profile image
              ),
            ),

            const SizedBox(height: 18), // Spacing

            const Text(
              "Sadeem Alotaibi", // User name
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5), // Spacing

            const Text(
              "Software Developer", // User role
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 25), // Spacing

            // User information tiles
            profileTile(Icons.person, "Username", "Sadeem"), // Username
            profileTile(Icons.email, "Email", "example@email.com"), // Email
            profileTile(Icons.phone, "Phone", "+966 *****"), // Phone
            profileTile(
                Icons.location_on, "Location", "Saudi Arabia"), // Location

            const Spacer(), // Push buttons to bottom

            // Edit profile button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Button color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)), // Rounded corners
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 14), // Padding
              ),
              onPressed: () {}, // Edit profile action
              child: const Text("Edit Profile", style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 12), // Spacing

            // Sign out button
            TextButton(
              onPressed: () {}, // Sign out action
              child: const Text("Sign Out",
                  style: TextStyle(color: Colors.red, fontSize: 16)),
            ),

            const SizedBox(height: 10), // Bottom spacing
          ],
        ),
      ),
    );
  }

  // Widget for each profile info row
  Widget profileTile(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14), // Inner padding
      margin: const EdgeInsets.only(bottom: 12), // Bottom spacing
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        border: Border.all(color: Colors.grey.shade300), // Border color
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black), // Icon
          const SizedBox(width: 15), // Spacing
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 13, color: Colors.grey)), // Title text
              Text(value,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)), // Value text
            ],
          )
        ],
      ),
    );
  }
}
