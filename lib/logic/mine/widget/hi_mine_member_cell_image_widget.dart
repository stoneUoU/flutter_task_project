import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiMineMemberCellImageWidget extends StatelessWidget {
  bool isPlace = true;

  HiMineMemberCellImageWidget({Key? key, required this.isPlace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 88.px,
      width: (ScreenW(context) - 32.px) / 5,
      child: Image.asset(
        this.isPlace
            ? 'assets/images/mine/ylz_mine_circle_add_place.png'
            : 'assets/images/mine/ylz_mine_circle_add.png',
      ),
    );
  }
}
