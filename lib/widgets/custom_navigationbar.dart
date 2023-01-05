import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:social_app_flutter/data/data.dart';
import 'package:social_app_flutter/screens/home_screen.dart';
import 'package:social_app_flutter/screens/profile_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GNav(
      backgroundColor: themeData.primaryColor,
      color: Colors.white38,
      activeColor: Colors.white,
      gap: 8,
      padding: EdgeInsets.all(16),
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomeScreen(),
            ),
          ),
        ),
        GButton(
          icon: Icons.favorite_border,
          text: 'Likes',
        ),
        GButton(
          icon: Icons.search,
          text: 'Explore',
        ),
        GButton(
          icon: Icons.account_circle,
          text: 'Profile',
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ProfileScreen(
                user: currentUser,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
