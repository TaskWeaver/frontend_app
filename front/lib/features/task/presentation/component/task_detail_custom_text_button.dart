import 'package:flutter/material.dart';

TextButton taskDetailCustomTextButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return TextButton(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: const Size(0, 0),
    ),
    onPressed: onPressed,
    child: Text(text, style: const TextStyle(color: Colors.black)),
  );
}
