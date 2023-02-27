import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';

class HiRouteCodeHeaderWidget extends StatelessWidget {
  const HiRouteCodeHeaderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ScreenW(context),
        height: 72,
        child: const Image(
            image: AssetImage('assets/images/route_code/ylz_top_pic.png'),
            fit: BoxFit.cover));
  }
}
