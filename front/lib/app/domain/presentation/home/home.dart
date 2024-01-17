import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('홈')),
        body: Center(
            child: Column(children: [
          ElevatedButton(
            onPressed: () {
              context.push('/login'); // 로그인 화면으로 이동
            },
            child: const Text('로그인'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/teamsList'); // 로그인 화면으로 이동
            },
            child: const Text('team'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/example'); // 로그인 화면으로 이동
            },
            child: const Text('formExample'),
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/projectDetail');
              },
              child: const Text('프로젝트')),
          ElevatedButton(
              onPressed: () {
                context.go('/projectCreation');
              },
              child: const Text('프로젝트 생성'))
        ])));
  }
}
