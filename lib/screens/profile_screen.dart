import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home_bottom_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          ],
        ),
      )),
      bottomNavigationBar: HomeBottomBar(),
    );
    ;
  }
}
