import 'package:flutter/material.dart';

// Placeholder profile screen for now.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen - Add your content here!'),
      ),
    );
  }
}
