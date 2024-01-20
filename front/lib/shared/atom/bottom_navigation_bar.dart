import 'package:flutter/material.dart';

class ProjectBottomNavigationBar extends StatelessWidget {
  const ProjectBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.my_library_books_outlined),
          label: '메모',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          label: '커뮤니티',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: '내 정보',
        ),
      ],
    );
  }
}
