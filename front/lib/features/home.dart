import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('홈')),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  ElevatedButton(
                    onPressed: () {
                      context.push('/signIn'); // 로그인 화면으로 이동
                    },
                    child: const Text('로그인'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/team'); // 회원가입 화면으로 이동
                    },
                    child: const Text('팀 조회'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/team/1/project/create'); // 회원가입 화면으로 이동
                    },
                    child: const Text('프로젝트 생성(팀 ID 1)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/teamsList'); // 로그인 화면으로 이동
                    },
                    child: const Text('team'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/example'); // 로그인 화면으로 이동
                    },
                    child: const Text('formExample'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/projectDetail');
                      },
                      child: const Text('프로젝트')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/projectCreation');
                      },
                      child: const Text('프로젝트 생성')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/projectUpdate');
                      },
                      child: const Text('프로젝트 수정')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/main');
                      },
                      child: const Text('메인 페이지')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/taskDetail');
                      },
                      child: const Text('taskDetail')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/myInfo');
                      },
                      child: const Text(
                        '마이 페이지',
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/design');
                      },
                      child: const Text(
                        '디자인 페이지',
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(height: 10),
                ])),
          ),
        ));
  }
}
