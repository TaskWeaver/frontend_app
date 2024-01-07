import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(color: Colors.black, fontSize: 12);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // 원하는 둥근 모서리 반지름 값 지정
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 12.0), // 원하는 패딩 값 지정
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
