import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WellcomeScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Kết nối với Realtime Database
      // ignore: deprecated_member_use
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.reference();

      // Lấy dữ liệu người dùng từ Realtime Database
      DatabaseEvent dataSnapshot = await databaseReference
          .child('users')
          .child(userCredential.user!.uid)
          .once();
      Map<dynamic, dynamic>? userData =
          dataSnapshot.snapshot.value as Map<dynamic, dynamic>?;

      // Sử dụng dữ liệu người dùng
      if (userData != null) {
        String username = userData['username'];
        String email = userData['email'];

        // Tiếp tục xử lý hoặc chuyển hướng đến màn hình khác
      } else {
        print('Không tìm thấy dữ liệu người dùng.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Không tìm thấy người dùng với email này.');
      } else if (e.code == 'wrong-password') {
        print('Mật khẩu không chính xác.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("images/hinhnen.jpg"),
              fit: BoxFit.cover,
              opacity: 0.6,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Highlands Coffee®",
              style: GoogleFonts.pacifico(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tài Khoản",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mật Khẩu",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text.rich(
                  TextSpan(
                      text: "Bạn quên ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                      children: [
                        TextSpan(
                          text: "mật khẩu?",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Ink(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      decoration: BoxDecoration(
                          color: Color(0xFFE57734),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Đăng ký tài khoản",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  onPressed: signIn,
                  child: Text('Đăng nhập'),
                ),
                //inkwell la gi?
                // InkWell(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => HomeScreen()));
                //   },
                //   child: Ink(
                //     child: Container(
                //       padding:
                //           EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                //       decoration: BoxDecoration(
                //           color: Color(0xFFE57734),
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text(
                //         "Đăng nhập",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 22,
                //           letterSpacing: 1,
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
