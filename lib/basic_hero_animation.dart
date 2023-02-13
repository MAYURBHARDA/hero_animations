import 'package:flutter/material.dart';

class BasicHeroAnimation extends StatelessWidget {
  const BasicHeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Hero Animation"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text("House Detail Page"),
                    ),
                    body: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topLeft,
                      color: Colors.lightBlueAccent,
                      child: Hero(
                        tag: 'House',
                        child: Image.asset("assets/images/image_2.jpg"),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: SizedBox(
            width: 100,
            child: Hero(
              tag: 'House',
              child: Image.asset("assets/images/image_2.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
