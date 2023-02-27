import 'dart:math';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/base/widget/hi_separator_view.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_timer_widget.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiHealthCodeWidget extends StatefulWidget {
  final Key key;
  final AnimationController controller;
  const HiHealthCodeWidget(this.key, this.controller) : super(key: key);
  @override
  HiHealthCodeWidgetState createState() => HiHealthCodeWidgetState();
}

class HiHealthCodeWidgetState extends State<HiHealthCodeWidget> {
  /**
   * 0 : 绿码
   * 1 : 橙码
   * 2 : 红码
   */
  int clickNum = 0;
  void generateClickNum(int clickNum) {
    setState(() {
      this.clickNum = clickNum;
    });
  }

  //生成提示文字：
  String generateLabel() {
    switch (this.clickNum) {
      case 0:
        return "未见异常（绿码）";
      case 1:
        return "建议隔离（橙码）";
      default:
        return "强制隔离（红码）";
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenW(context) - 32.px,
      margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(10.0.px)),
      ),
      height: 487.px,
      child: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
                        child: ScaleTransition(
                          alignment: Alignment.center,
                          scale: widget.controller,
                          child: Text(
                            generateLabel(),
                            style: TextStyle(
                                color: generateColor(),
                                fontSize: 18.px,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
                  child: const HiHealthCodeTimerWidget(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.px),
                  width: 240.px,
                  height: 240.px,
                  decoration: BoxDecoration(
                    gradient: codeLinearGradient(fromTop: true),
                    borderRadius: BorderRadius.all(Radius.circular(10.0.px)),
                  ),
                  child: Center(
                    child: Container(
                        width: 230.px,
                        height: 230.px,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0.px)),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            BarcodeWidget(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.px)),
                              ),
                              color: generateColor(),
                              barcode: Barcode.qrCode(
                                errorCorrectLevel:
                                    BarcodeQRCorrectionLevel.high,
                              ),
                              data: "${_randomBit(100)}",
                              width: 218.px,
                              height: 218.px,
                            ),
                            Container(
                              width: 40.px,
                              height: 40.px,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3.0.px),
                                child: Image.asset(
                                  'assets/images/health_code/health_code_logo.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
                  child: Text(
                    "${_randomBit(12)}",
                    style: TextStyle(
                      color: color_FF303133,
                      fontSize: 18.px,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: (ScreenW(context) - 64.px) / 2,
                        height: 50.px,
                        decoration: new BoxDecoration(
                          color: HiColorMZTLightBlueView,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0.px),
                              bottomLeft: Radius.circular(25.0.px)),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 16.px),
                                  width: 12.px,
                                  height: 12.px,
                                  child: Image.asset(
                                    'assets/images/health_code/health_code_nucleic_acid.png',
                                    fit: BoxFit.fill,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(left: 8.px),
                                  child: Text(
                                    "暂无7天内核酸数据",
                                    style: TextStyle(
                                      color: HiColorMZTBlueView,
                                      fontSize: 12.px,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: (ScreenW(context) - 64.px) / 2,
                        height: 50.px,
                        decoration: new BoxDecoration(
                          color: HiColorMZTLightGoldView,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0.px),
                              bottomRight: Radius.circular(25.0.px)),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 16.px),
                                  child: Text("2",
                                      style: TextStyle(
                                          color: HiColorMZTVaccinesView,
                                          fontSize: 24.px,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                  margin: EdgeInsets.only(left: 16.px),
                                  child: Text("新冠疫苗剂次",
                                      style: TextStyle(
                                          color: color_FFE6A23C,
                                          fontSize: 12.px))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
                  child: HiSeparatorView(color: color_FFCECECE),
                  height: 1.0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: InkWell(
                          child: Center(
                            child: Text(
                              "家人健康码",
                              style: TextStyle(
                                color: HiColorMZTBlueView,
                                fontSize: 12.px,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          child: Center(
                            child: Text(
                              "添加到桌面",
                              style: TextStyle(
                                color: HiColorMZTBlueView,
                                fontSize: 12.px,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          child: Center(
                            child: Text(
                              "客服热线",
                              style: TextStyle(
                                color: HiColorMZTBlueView,
                                fontSize: 12.px,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
                child: Image.asset(
              'assets/images/health_code/health_code_left.png',
              fit: BoxFit.fill,
            )),
            top: 80.px,
            left: 0,
          ),
          Positioned(
            child: Container(
                child: Image.asset(
              'assets/images/health_code/health_code_right.png',
              fit: BoxFit.fill,
            )),
            top: 80.px,
            right: 0,
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
