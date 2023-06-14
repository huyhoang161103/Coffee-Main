import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/bottom_bar.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Thông báo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          'images/giamgia.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      title: Text(
                        'Highlands Coffee giảm 50% toàn menu qua GrabFood',
                        style: TextStyle(
                          color: Color(0xFFE57734),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Hãy nhanh tay đặt mua Highlands Coffee qua Garbfood để được nhận giảm giá 50% nhé!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          'images/giamgia4.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      title: Text(
                        'Highlands Coffee đồng giá 39k Trà và Phindi',
                        style: TextStyle(
                          color: Color(0xFFE57734),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Đồng giá 39k cho cả 03 size . Áp dụng cho Trà và PhinDi mọi cửa hàng trên toàn quốc ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 2),
    );
  }
}
