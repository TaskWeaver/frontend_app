import 'package:flutter/material.dart';

class Picker extends StatelessWidget {
  const Picker({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(label),
      TextButton(onPressed: () {}, child: const Text('+'))
    ]);
  }
}
