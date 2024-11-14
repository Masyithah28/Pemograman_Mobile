import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second - Sofiaa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Pink'),
              onPressed: () {
                color = const Color.fromRGBO(255, 128, 171, 1);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Matcha'),
              onPressed: () {
                color = const Color.fromRGBO(77, 182, 172, 1);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Lilac'),
              onPressed: () {
                color = const Color.fromRGBO(186, 104, 200, 1);
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}