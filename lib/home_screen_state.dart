import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home_screen.dart';

class _HomeScreenState extends State<HomeScreen> {
  String _message = "";
  final _inputController = TextEditingController();
  void _sayhi() {
    setState(() {
      _message = "Hello ${_inputController.text}!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Say hello App')),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _sayhi,
                child: const Text("Say hi"),
              ),
              Text(
                _message,
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
        ));
  }
}
