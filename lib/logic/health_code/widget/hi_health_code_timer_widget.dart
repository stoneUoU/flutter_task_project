import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiHealthCodeTimerWidget extends StatefulWidget {
  const HiHealthCodeTimerWidget({Key? key}) : super(key: key);

  @override
  _HiHealthCodeTimerWidgetState createState() =>
      _HiHealthCodeTimerWidgetState();
}

class _HiHealthCodeTimerWidgetState extends State<HiHealthCodeTimerWidget> {
  String fireTime() {
    DateTime dateTime = DateTime.now();
    return dateTime.toString().substring(0, 19);
  }

  String timeString = "";
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const timeout = const Duration(seconds: 1);
    this.timer = Timer.periodic(timeout, (timer) {
      if (!mounted) return;
      setState(() {
        this.timeString = "${fireTime()}";
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${this.timeString}".length == 0 ? "${fireTime()}" : "${this.timeString}",
      style: TextStyle(
          color: color_FF303133, fontSize: 24.px, fontWeight: FontWeight.bold),
    );
  }
}
