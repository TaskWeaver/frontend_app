import 'package:flutter/material.dart';

class ScaffoldWithMyInfo extends StatelessWidget {
  const ScaffoldWithMyInfo({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Info'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('마이페이지'),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, border: Border.all(width: 1)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('닉네임'),
            const SizedBox(
              height: 10,
            ),
            const Text('john.doe@example.com'),
            const SizedBox(
              height: 10,
            ),
            const Text('타일'),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: child)
          ],
        ),
      ),
    );
  }
}
