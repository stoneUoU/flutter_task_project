import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiVersionAlertDialog extends Dialog {
  HiVersionAlertDialog(
      {Key? key, required this.data, required this.closeCallback})
      : super(key: key);
  final data;
  final closeCallback;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 375.px,
            width: 270.px,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 325.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0.px)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 270.px,
                            height: 120.px,
                            child: Image.asset(
                                'assets/images/common/flutter_version_update.png',
                                fit: BoxFit.fill),
                          ),
                          Positioned(
                            child: Container(
                              width: 270.px,
                              alignment: Alignment.center,
                              child: new Text("发现新版本",
                                  style: new TextStyle(
                                      fontSize: 24.0.px,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.left),
                            ),
                            left: 0,
                            top: 32.px,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.px, 0.px, 16.px, 0),
                        child: RichText(
                          text: TextSpan(
                              text: "更新内容：",
                              style: TextStyle(
                                  height: 1.5,
                                  color: color_FF303133,
                                  fontSize: 16.px,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: "v1.3.6(10.2MB)",
                                    style: TextStyle(
                                        height: 1.6,
                                        color: color_FF606266,
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.w300))
                              ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.px, 12.px, 16.px, 12.px),
                        color: Colors.white,
                        height: 96.px,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.px, 0.px, 16.px, 0),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(22.0.px)),
                          color: color_FF4272e0,
                        ),
                        height: 44.px,
                        child: Center(
                          child: new Text("立即更新",
                              style: new TextStyle(
                                  fontSize: 14.0.px, color: Colors.white),
                              textAlign: TextAlign.center),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50.px,
                  child: GestureDetector(
                    onTap: () {
                      // 点击关闭事件
                      if (closeCallback != null) {
                        closeCallback();
                      }
                      Navigator.pop(context, true);
                    },
                    child: Center(
                      child: Image.asset(
                          'assets/images/common/flutter_version_close.png',
                          fit: BoxFit.fill),
                    ),
                  ),
                )
              ],
            )));
  }
}
