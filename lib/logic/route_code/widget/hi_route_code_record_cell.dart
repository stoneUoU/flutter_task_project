import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

// ignore: must_be_immutable
class HiRouteCodeRecordCell extends StatelessWidget {
  const HiRouteCodeRecordCell({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(children: [
          Container(
            margin: EdgeInsets.fromLTRB(24.px, 0, 0, 0),
            height: 96.px,
            width: (ScreenW(context) - 48.px - 16.px) / 2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.px))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.px),
                  alignment: Alignment.centerLeft,
                  height: 48.px,
                  child: Text("无14天内记录",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.px,
                        fontWeight: FontWeight.bold,
                        color: color_FF303133,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.px),
                  height: 0.5.px,
                  width: 48.px,
                  color: color_FFCECECE,
                ),
                Container(
                    margin: EdgeInsets.only(left: 16.px),
                    height: 47.5.px,
                    alignment: Alignment.centerLeft,
                    child: Text("无14天内记录",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.px,
                          color: color_FF606266,
                        )))
              ],
            ),
          ),
          const Positioned(
              right: 0,
              bottom: 0,
              child: Image(
                  image: AssetImage(
                      "assets/images/route_code/ylz_record_fresh.png"),
                  fit: BoxFit.cover))
        ]),
        Stack(children: [
          Container(
            margin: EdgeInsets.fromLTRB(16.px, 0, 0, 0),
            height: 96.px,
            width: (ScreenW(context) - 48.px - 16.px) / 2,
            decoration: BoxDecoration(
                color: HiColorAllInsertCode,
                borderRadius: BorderRadius.all(Radius.circular(12.0.px))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 16.px),
                    alignment: Alignment.centerLeft,
                    height: 48.px,
                    child: Text("已全程接种",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.px,
                          fontWeight: FontWeight.bold,
                          color: color_FF303133,
                        ))),
                Container(
                  margin: EdgeInsets.only(left: 16.px),
                  height: 0.5.px,
                  width: 48.px,
                  color: color_FFCECECE,
                ),
                Container(
                    margin: EdgeInsets.only(left: 16.px),
                    height: 47.5.px,
                    alignment: Alignment.centerLeft,
                    child: Text("疫苗接种",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.px,
                          color: color_FF606266,
                        )))
              ],
            ),
          ),
          const Positioned(
            right: 0,
            bottom: 0,
            child: Image(
                image:
                    AssetImage("assets/images/route_code/ylz_jiezhong_all.png"),
                fit: BoxFit.cover),
          )
        ])
      ],
    );
  }
}
