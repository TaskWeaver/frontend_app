import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SocialLoginInfoScreen extends StatelessWidget {
  const SocialLoginInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              context.push('/changeMyInfoList');
            },
            child: Text('⚙ 개인정보 수정')),
        Expanded(
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.all(80.0),
          child: TextButton(onPressed: () {}, child: Text('로그아웃')),
        )
      ],
    );
  }
}
