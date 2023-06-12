import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/cart_screen.dart';
import 'package:flutter_application_2/screens/favorites_screen.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/notifications_screen.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;

  const BottomBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFF212325),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (currentIndex != 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
            child: Icon(
              Icons.home,
              color: currentIndex == 0 ? Color(0xFFE57734) : Colors.white,
              size: 35,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex != 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesPage()),
                );
              }
            },
            child: Icon(
              Icons.favorite_outlined,
              color: currentIndex == 1 ? Color(0xFFE57734) : Colors.white,
              size: 35,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex != 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              }
            },
            child: Icon(
              Icons.notifications,
              color: currentIndex == 2 ? Color(0xFFE57734) : Colors.white,
              size: 35,
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     if (currentIndex != 3) {
          //       Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(builder: (context) => CartPage()),
          //       );
          //     }
          //   },
          //   child: Icon(
          //     Icons.shopping_cart_rounded,
          //     color: currentIndex == 3 ? Color(0xFFE57734) : Colors.white,
          //     size: 35,
          //   ),
          // ),
        ],
      ),
    );
  }
}
