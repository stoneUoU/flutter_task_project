import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiMineMemberCellLabelWidget extends StatelessWidget {
  const HiMineMemberCellLabelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.px,
      width: (ScreenW(context) - 32.px) / 5,
      child: Column(
        children: [
          Image.asset(
            'assets/images/mine/ylz_mine_baby_avater.png',
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.px),
            child: Text(
              'iOS工程师',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color_FF606266, fontSize: 14.0.px),
            ),
          )
        ],
      ),
    );
  }
}
