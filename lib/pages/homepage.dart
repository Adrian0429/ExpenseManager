import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 10,
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.favorite_border_outlined,
            text: "Hobby",
          ),
          GButton(
            icon: Icons.phone_callback_outlined,
            text: "Contact Me",
          ),
          GButton(
            icon: Icons.person,
            text: 'Bio/Profile',
          ),
        ],
      ),
    );
  }
}
