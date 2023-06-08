import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/favorites_screen.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';
import 'package:flutter_application_2/screens/sign_in.dart';
import 'package:flutter_application_2/widgets/home_bottom_bar.dart';
import 'package:flutter_application_2/widgets/items_widget1.dart';
import 'package:flutter_application_2/widgets/items_widget2.dart';
import 'package:flutter_application_2/widgets/items_widget3.dart';
import 'package:flutter_application_2/widgets/items_widget4.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final User = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
    _tabController.addListener(() {
      setState(() {});
    });
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  List<Widget> centerWidgets = [
    ItemsWidget1(),
    ItemsWidget2(category: "Cà phê"),
    ItemsWidget3(category: "Trà sữa"),
    ItemsWidget4(category: "Bánh ngọt"),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
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
                  "Hôm nay bạn uống gì?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50, 54, 56),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tìm kiếm thức uống",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Color(0xFFE57734),
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFFE57734),
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                labelStyle: TextStyle(fontSize: 20),
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(text: "Best Seller"),
                  Tab(text: "Cà phê"),
                  Tab(text: "Trà sữa"),
                  Tab(text: "Bánh ngọt"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: centerWidgets[_tabController.index],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
      drawer: Drawer(
        backgroundColor: Color(0xFF212325),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFE57734),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Thông tin khách hàng',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("images/logo.png"),
                      backgroundColor: Color(0xFF212325),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              title: GestureDetector(
                child: Text(
                  'Giỏ hàng của tôi',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Đóng Drawer (nếu cần thiết)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              title: GestureDetector(
                child: Text(
                  'Món yêu thích của tôi',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Đóng Drawer (nếu cần thiết)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesPage()),
                  );
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, right: 80, left: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        color: Color(0xFFE57734),
                        child: Row(children: [
                          Icon(Icons
                              .exit_to_app), // Thêm icon exit_to_app vào nút
                          SizedBox(
                              width: 8.0), // Tạo khoảng cách giữa icon và chữ
                          Text(
                            'Đăng xuất',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ]))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
