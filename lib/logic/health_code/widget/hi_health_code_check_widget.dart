import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiHealthCodeCheckWidget extends StatelessWidget {
  const HiHealthCodeCheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenW(context) - 32.px,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(10.0.px)),
      ),
      margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
      height: 54.px,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16.px, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              "通行大数据行程卡",
              style: TextStyle(color: color_FF303133, fontSize: 14.px),
            ),
          ),
          Positioned(
            child: InkWell(
              child: Container(
                width: 96.px,
                height: 36.px,
                decoration: new BoxDecoration(
                  color: HiColorMZTBlueView,
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(18.0.px)),
                ),
                child: Center(
                  child: Text(
                    "点击核验",
                    style: TextStyle(color: Colors.white, fontSize: 14.px),
                  ),
                ),
              ),
            ),
            top: 9.px,
            right: 16.px,
          )
        ],
      ),
    );
  }
}
