import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/favorites_screen.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/notifications_screen.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(color: Color(0xFF212325), boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Icon(
              Icons.home,
              color: Color(0xFFE57734),
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
            child: Icon(
              Icons.favorite_outlined,
              color: Color(0xFFE57734),
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
            child: Icon(
              Icons.notifications,
              color: Color(0xFFE57734),
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Icon(
              Icons.person,
              color: Color(0xFFE57734),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
