import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key, required this.duration, this.onFinished})
      : assert(duration > Duration.zero, 'Duration must be greater than zero'),
        assert(duration < const Duration(hours: 1),
            'Duration must be less than an hour'),
        super(key: key);

  final Duration duration;
  final void Function()? onFinished;


  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  late int _start;

  @override
  void initState() {
    super.initState();
    _start = widget.duration.inSeconds;
    startTimer();
  }

  void finishTimer() {
    _timer.cancel();
    widget.onFinished?.call();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) => setState(
        () {
          if (_start < 1) {
            finishTimer();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    finishTimer();
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
