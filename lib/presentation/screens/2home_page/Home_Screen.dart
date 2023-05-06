import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        width: 200,
        height: 200,
        color: Color(0xffD6A4DE),
        child: Column(
          children: [
            Container(
              child: Text("sa"),
            ),
            MaterialButton(
              onPressed: () {},
            ),
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
