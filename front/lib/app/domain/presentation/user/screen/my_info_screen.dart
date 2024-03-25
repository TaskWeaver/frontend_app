import 'package:flutter/material.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Info'),
      ),
      body: Column(
        children: [
          Text('마이페이지'),
          SizedBox(height: 20,),
          CircleAvatar(),
          Text('닉네임'),
          Text('john.doe@example.com'),
          Text('타일'),
          Text('개인정보 수정'),
          TextButton(onPressed: (){}, child: Text('로그아웃'))
        ],
      ),
    );
  }
}
