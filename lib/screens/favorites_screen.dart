import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/bottom_bar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.sort_rounded,
                      color: Colors.white.withOpacity(0.5),
                      size: 35,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white.withOpacity(0.5),
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Yêu thích',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Image.asset(
                'images/caphesua.png',
              ),
              title: Text(
                'Cà Phê Sữa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
              subtitle: Text(
                'Description for Item 1',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ),
            ListTile(
              leading: Image.asset(
                'images/xoai.png',
              ),
              title: Text(
                'Trà Thạch Đào',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
              subtitle: Text(
                'Description for Item 1',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomBar(currentIndex: 1),
    );
    ;
  }
}
