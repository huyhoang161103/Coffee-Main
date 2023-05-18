import 'package:flutter/material.dart';

class HomeStaleless extends StatelessWidget {
  const HomeStaleless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Demo App')),
        body: Column(
          children: [
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Text",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter Password",
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {},
                  )),
            )
          ],
        ));
  }
}
