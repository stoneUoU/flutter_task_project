import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiInfoAlertDialog extends Dialog {
  HiInfoAlertDialog(
      {Key? key,
      required this.data,
      required this.closeCallback,
      required this.successCallback})
      : super(key: key);
  final data;
  final closeCallback;
  final successCallback;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 375.px,
            width: 270.px,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      // 点击关闭事件
                      print("进医保APP");
                      if (successCallback != null) {
                        successCallback();
                      }
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      height: 325.px,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0.px)),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                          'assets/images/common/flutter_luck.png',
                          fit: BoxFit.fill),
                    )),
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
