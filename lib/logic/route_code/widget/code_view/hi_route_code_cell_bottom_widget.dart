import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/base/widget/hi_separator_view.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiRouteCodeCellBottomWidget extends StatelessWidget {
  const HiRouteCodeCellBottomWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 100.px,
        width: ScreenW(context) - 48.px,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16.px, 32.px, 0, 0),
              child: Row(
                children: [
                  Text("点击查询行程卡",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.px,
                        fontWeight: FontWeight.bold,
                        color: color_FF303133,
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(8.px, 0, 0, 0),
                    child: Image(
                        width: 18.px,
                        height: 18.px,
                        image: AssetImage(
                            "assets/images/route_code/ylz_route_to_search.png"),
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.px, 8.px, 0, 0),
              child: Text("查询14天内是否到访过中高风险地区",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.px,
                    color: color_FF909399,
                  )),
            )
          ],
        ),
      ),
      Positioned(
          child: Image(
              width: 18.px,
              height: 18.px,
              image:
                  AssetImage("assets/images/route_code/ylz_left_jiantou.png"),
              fit: BoxFit.cover),
          left: -4.px,
          top: 8.px),
      Positioned(
          child: Image(
              width: 18.px,
              height: 18.px,
              image:
                  AssetImage("assets/images/route_code/ylz_right_jiantou.png"),
              fit: BoxFit.cover),
          right: -4.px,
          top: 8.px),
      Positioned(
          child: Container(
            child: const HiSeparatorView(color: color_FFCECECE),
            height: 1.0.px,
          ),
          left: 18.px,
          right: 18.px,
          top: 17.px),
      Positioned(
          child: Image(
              width: 56.px,
              height: 72.px,
              image: AssetImage("assets/images/route_code/ylz_process.png"),
              fit: BoxFit.cover),
          right: 0,
          bottom: 0)
    ]);
  }
}
