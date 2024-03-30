import 'package:flutter/material.dart';

class ChangeInfoListScreen extends StatelessWidget {
  const ChangeInfoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(onPressed: () {}, child: const Text('개인정보 변경')),
        FilledButton(onPressed: () {}, child: const Text('비밀번호 변경')),
        FilledButton(onPressed: () {}, child: const Text('탈퇴하기')),
      ],
    );
  }
}
