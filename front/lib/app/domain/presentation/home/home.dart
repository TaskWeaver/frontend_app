import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('홈')),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login'); // 로그인 화면으로 이동
          },
          child: const Text('로그인'),
        )));
  }
}
