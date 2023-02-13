import 'package:flutter/material.dart';
import 'package:hero_animations/practice.dart';

import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RadialExpansionDemo(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero"),
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailPage()));
              },
              child: Hero(
                tag: "background",
                child: Image.asset(
                  "assets/images/image_1.jpg",
                  height: 100,
                  width: 150,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailPage()));
              },
              child: Hero(
                tag: "main",
                child: Image.asset(
                  "assets/images/image_2.jpg",
                  width: 150,
                  height: 100,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
