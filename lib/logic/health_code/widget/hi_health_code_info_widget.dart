import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

typedef HiHealthCodeInfoWidgetClickListener = void Function(int idStr);

class HiHealthCodeInfoWidget extends StatefulWidget {
  final HiHealthCodeInfoWidgetClickListener healthCodeInfoWidgetClickListener;
  const HiHealthCodeInfoWidget(
      {Key? key, required this.healthCodeInfoWidgetClickListener})
      : super(key: key);

  @override
  _HiHealthCodeInfoWidgetState createState() => _HiHealthCodeInfoWidgetState();
}

class _HiHealthCodeInfoWidgetState extends State<HiHealthCodeInfoWidget> {
  bool isOn = false;
  int clickNum = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenW(context) - 32.px,
      margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
      height: 136.px,
      child: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16.px),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 28.px,
                        height: 28.px,
                        child: Image.asset(
                          'assets/images/health_code/health_code_logo_blue.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12.px, 0, 0, 0),
                        child: Text(
                          "福建八闽健康码",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.px,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12.px, 0, 0, 0),
                        width: 18.px,
                        height: 18.px,
                        child: InkWell(
                          child: Image.asset(
                            this.isOn
                                ? 'assets/images/health_code/health_code_show.png'
                                : 'assets/images/health_code/health_code_hide.png',
                            fit: BoxFit.fill,
                          ),
                          onTap: () {
                            setState(() {
                              this.isOn = !this.isOn;
                            });
                          },
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
                  child: Text(
                    this.isOn ? "姓  名： 林磊" : "姓  名： 林*",
                    style: TextStyle(color: Colors.white, fontSize: 14.px),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
                  child: Text(
                    this.isOn
                        ? "身份证号:    362324199509185186"
                        : "身份证号:    362324********5186",
                    style: TextStyle(color: Colors.white, fontSize: 14.px),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: InkWell(
              child: Container(
                width: 96.px,
                height: 36.px,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(18.0.px)),
                ),
                child: InkWell(
                  child: Center(
                    child: Text(
                      "改变颜色",
                      style:
                          TextStyle(color: HiColorMZTBlueView, fontSize: 14.px),
                    ),
                  ),
                  onTap: () {
                    this.clickNum = this.clickNum + 1;
                    if (this.clickNum > 2) {
                      this.clickNum = 0;
                    }
                    if (widget.healthCodeInfoWidgetClickListener != null) {
                      widget.healthCodeInfoWidgetClickListener(this.clickNum);
                    }
                  },
                ),
              ),
            ),
            top: 50.px,
            right: 16.px,
          )
        ],
      ),
    );
  }
}
