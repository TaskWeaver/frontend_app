import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key, required this.timeInSeconds}) : super(key: key);
  final int timeInSeconds;

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  late int _start;

  @override
  void initState() {
    super.initState();
    _start = widget.timeInSeconds;
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var minutes = _start ~/ 60;
    var seconds = _start % 60;

    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Text(
          '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}'),
    );
  }
}
