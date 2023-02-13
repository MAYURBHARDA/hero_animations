import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Center(
        child: Column(
          children: [
            // Container(
            //   child: Hero(
            //     tag: "background",
            //     child: Image.asset("assets/images/image_1.jpg"),
            //   ),
            // ),
            Hero(
              tag: "main",
              child: Image.asset("assets/images/image_2.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
