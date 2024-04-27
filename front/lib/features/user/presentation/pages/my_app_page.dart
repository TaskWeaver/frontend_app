import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppPage extends ConsumerStatefulWidget {
  const MyAppPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppPageState();
}

class _MyAppPageState extends ConsumerState<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TeamW2aver',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: TextButton(onPressed: () {}, child: const Text('로그아웃')),
          )
        ],
      ),
    );
  }
}
