import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/reuseble/reuseble_widget.dart';
import 'package:flutter_application_2/screens/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorText = '';

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password,
        );

        // Đăng nhập thành công, userCredential.user chứa thông tin người dùng đã đăng nhập

        // Chuyển đến màn hình chính hoặc trang khác
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } catch (e) {
        // Xử lý lỗi đăng nhập
        setState(() {
          _errorText = 'Đăng nhập thất bại.';
        });
        print('Đăng nhập thất bại: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 100, bottom: 40),
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("images/hinhnen.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Highlands Coffee®",
                style: GoogleFonts.pacifico(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                      child: TextFormField(
                        controller: _usernameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Nhập Email của bạn",
                          labelStyle: TextStyle(
                              color: Colors.white), // Màu chữ cho label
                          prefixIcon: Icon(Icons.person_outline,
                              color: Colors.white), // Màu icon
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .white), // Màu đường viền khi không focus
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.white), // Màu đường viền khi focus
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red), // Màu đường viền khi có lỗi
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .red), // Màu đường viền khi focus và có lỗi
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Vui lòng nhập Email.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Nhập mật khẩu của bạn",
                          labelStyle: TextStyle(
                              color: Colors.white), // Màu chữ cho label
                          prefixIcon: Icon(Icons.lock_outline,
                              color: Colors.white), // Màu icon
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .white), // Màu đường viền khi không focus
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.white), // Màu đường viền khi focus
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red), // Màu đường viền khi có lỗi
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .red), // Màu đường viền khi focus và có lỗi
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Vui lòng nhập mật khẩu.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                      child: signInsignUpButton(context, true, () {
                        _login();
                      }),
                    ),
                    if (_errorText.isNotEmpty)
                      Text(
                        _errorText,
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              signUpOption(context),
            ],
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Bạn chưa có tài khoản? ",
        style: TextStyle(color: Colors.white70),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupPage()));
        },
        child: Text(
          "Đăng kí",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
