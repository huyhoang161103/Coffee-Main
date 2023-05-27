import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Đăng ký thành công, có thể thực hiện các thao tác khác ở đây

      // Lưu thông tin người dùng vào Realtime Database
      DatabaseReference usersRef =
          // ignore: deprecated_member_use
          FirebaseDatabase.instance.reference().child('users');
      usersRef.child(email.replaceAll('.', '_')).set({
        'email': email,
        'password': password,
      });

      // Lưu thông tin thành công
      print('Lưu thông tin người dùng thành công');
    } catch (e) {
      // Xử lý lỗi đăng ký tại đây
      print('Đăng ký thất bại: $e');
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Kiểm tra xem có nhập đầy đủ thông tin không
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: 'Vui lòng nhập đầy đủ thông tin');
      return;
    }

    // Gọi hàm đăng ký tài khoản
    signUpWithEmailAndPassword(email, password).then((value) {
      // Đăng ký thành công
      Fluttertoast.showToast(msg: 'Đăng ký thành công');
      // Thực hiện các thao tác khác ở đây, ví dụ: chuyển hướng đến màn hình chính
    }).catchError((error) {
      // Xử lý lỗi đăng ký
      Fluttertoast.showToast(msg: 'Đăng ký thất bại: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }
}
