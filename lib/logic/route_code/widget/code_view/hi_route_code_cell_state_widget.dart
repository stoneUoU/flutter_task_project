import 'dart:math';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_timer_widget.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiRouteCodeCellStateWidget extends StatefulWidget {
  const HiRouteCodeCellStateWidget({Key? key}) : super(key: key);
  @override
  HiRouteCodeCellStateWidgetState createState() =>
      HiRouteCodeCellStateWidgetState();
}

class HiRouteCodeCellStateWidgetState
    extends State<HiRouteCodeCellStateWidget> {
  bool isOn = false;
  /**
   * 0 : 绿码
   * 1 : 橙码
   * 2 : 红码
   */
  int clickNum = 0;
  void generateClickNum(int clickNum) {
    print("AAAAAAA");
    setState(() {
      this.clickNum = clickNum;
    });
  }

  //生成提示文字：
  String generateLabel() {
    switch (this.clickNum) {
      case 0:
        return "绿码：健康状态为低风险";
      case 1:
        return "黄码：健康状态为中风险";
      default:
        return "红码：健康状态为高风险";
    }
  }

  Color generateColor() {
    switch (this.clickNum) {
      case 0:
        return HiColorMZTGreenView;
      case 1:
        return HiColorMZTOrangeView;
      default:
        return HiColorMZTRedView;
    }
  }

  String _randomBit(int len) {
    String scopeF = '123456789'; //首位
    String scopeC = '0123456789'; //中间
    String result = '';
    for (int i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }
    String numString = "";
    for (int i = 0; i < result.length; i++) {
      if (i % 4 == 0 && i > 0) {
        numString += "  ";
      }
      numString += result[i];
    }
    return numString;
  }

  Widget funcCodeLogic() {
    if (this.isOn) {
      return Container(
          margin: EdgeInsets.only(top: 8.px),
          width: 218.px,
          height: 218.px,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.px),
              child: Image(
                  width: 218.px,
                  height: 218.px,
                  image: const AssetImage(
                      "assets/images/route_code/ylz_mine_avater.png"),
                  fit: BoxFit.cover)));
    }
    return Container(
      margin: EdgeInsets.only(top: 8.px),
      width: 218.px,
      height: 218.px,
      decoration: BoxDecoration(
        gradient: codeLinearGradient(fromTop: true),
        borderRadius: BorderRadius.all(Radius.circular(10.0.px)),
      ),
      child: Center(
        child: Container(
            width: 208.px,
            height: 208.px,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0.px)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                BarcodeWidget(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0.px)),
                  ),
                  color: generateColor(),
                  barcode: Barcode.qrCode(
                    errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                  ),
                  data: "${_randomBit(100)}",
                  width: 218.px,
                  height: 218.px,
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0.px),
                    child: Image(
                        width: 28.px,
                        height: 28.px,
                        image: const AssetImage(
                            "assets/images/route_code/ylz_code_middle_logo.png"),
                        fit: BoxFit.cover),
                  ),
                  width: 32.px,
                  height: 32.px,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.0.px)),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.px,
      color: Colors.white,
      width: ScreenW(context) - 48.px,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.px),
            child: const HiHealthCodeTimerWidget(),
          ),
          Stack(children: [
            Container(
              child: Center(child: funcCodeLogic()),
              width: ScreenW(context) - 48.px,
            ),
            Positioned(
                child: Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          width: 48.px,
                          height: 59.px,
                          decoration: BoxDecoration(
                            color: this.isOn
                                ? HiColorCodeButtonbgColor
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0.px)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 6.px),
                                  child: Image(
                                      width: 24.px,
                                      height: 24.px,
                                      image: AssetImage(this.isOn
                                          ? "assets/images/route_code/ylz_qrcode_bleak.png"
                                          : "assets/images/route_code/ylz_qrcode_bright.png"),
                                      fit: BoxFit.cover)),
                              Container(
                                  child: Text("亮码",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.px,
                                        color: this.isOn
                                            ? color_FF303133
                                            : HiColorCodeBlue,
                                      )))
                            ],
                          ),
                        ),
                        onTap: () {
                          if (!this.isOn) {
                            return;
                          }
                          setState(() {
                            this.isOn = false;
                          });
                        },
                      ),
                      Container(
                          width: 48.px,
                          height: 0.5.px,
                          color: HiColorRouteCode),
                      InkWell(
                        child: Container(
                            width: 48.px,
                            height: 58.5.px,
                            decoration: BoxDecoration(
                              color: !this.isOn
                                  ? HiColorCodeButtonbgColor
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8.0.px)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 6.px),
                                    child: Image(
                                        width: 24.px,
                                        height: 24.px,
                                        image: AssetImage(this.isOn
                                            ? "assets/images/route_code/ylz_personal_info_bleak.png"
                                            : "assets/images/route_code/ylz_personal_info_bright.png"),
                                        fit: BoxFit.cover)),
                                Container(
                                    child: Text("人像",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12.px,
                                          color: !this.isOn
                                              ? color_FF303133
                                              : HiColorCodeBlue,
                                        )))
                              ],
                            )),
                        onTap: () {
                          if (this.isOn) {
                            return;
                          }
                          setState(() {
                            this.isOn = true;
                          });
                        },
                      )
                    ],
                  ),
                  width: 48.px,
                  height: 120.px,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: HiColorRouteCode,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0.px),
                        bottomRight: Radius.circular(8.0.px)),
                  ),
                ),
                left: (ScreenW(context) - 48.px) / 2 + 109.px,
                top: 57.px)
          ]),
          Container(
            margin: EdgeInsets.only(top: 12.px),
            child: Text(
              generateLabel(),
              style: TextStyle(
                  color: generateColor(),
                  fontSize: 18.px,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.px),
            child: InkWell(
              child: Container(
                  height: 44.px,
                  width: ScreenW(context) - 120.px,
                  decoration: BoxDecoration(
                      color: HiColorCodeBlue,
                      borderRadius:
                          BorderRadius.all(new Radius.circular(22.0.px)),
                      boxShadow: [
                        BoxShadow(
                          color: HiColorCodeBlue, //底色,阴影颜色
                          offset: Offset(0, 6), //阴影位置,从什么位置开始
                          blurRadius: 12.px, // 阴影模糊层度
                          spreadRadius: 0, //阴影模糊大小
                        )
                      ]),
                  alignment: Alignment.center,
                  child: Text("扫一扫",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.px,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))),
            ),
          )
        ],
      ),
    );
  }

  codeLinearGradient({bool fromTop = false}) {
    return LinearGradient(
        begin: fromTop ? Alignment.topCenter : Alignment.bottomCenter,
        end: fromTop ? Alignment.bottomCenter : Alignment.topCenter,
        colors: [
          HiColorMZTGradientOneView,
          HiColorMZTGradientTwoView,
          HiColorMZTGradientThreeView
        ]);
  }
}
