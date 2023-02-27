import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/widget/hi_separator_view.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

typedef HiRouteCodeCellInfoWidgetClickListener = void Function(int idStr);

class HiRouteCodeCellInfoWidget extends StatefulWidget {
  final HiRouteCodeCellInfoWidgetClickListener
      routeCodeCellInfoWidgetClickListener;
  const HiRouteCodeCellInfoWidget(
      {Key? key, required this.routeCodeCellInfoWidgetClickListener})
      : super(key: key);
  @override
  _HiRouteCodeCellInfoWidgetState createState() =>
      _HiRouteCodeCellInfoWidgetState();
}

class _HiRouteCodeCellInfoWidgetState extends State<HiRouteCodeCellInfoWidget> {
  bool isOn = false;
  int clickNum = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 75.px,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16.px, 10.px, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 6.px, 8.px, 0),
                              child: InkWell(
                                child: Image(
                                    width: 24.px,
                                    height: 18.px,
                                    image: AssetImage(this.isOn
                                        ? 'assets/images/route_code/ylz_route_eye_open.png'
                                        : 'assets/images/route_code/ylz_route_eye_close.png'),
                                    fit: BoxFit.cover),
                                onTap: () {
                                  setState(() {
                                    this.isOn = !this.isOn;
                                  });
                                },
                              ),
                            ),
                            Text(this.isOn ? "林磊" : "*磊",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20.px,
                                  fontWeight: FontWeight.bold,
                                  color: color_FF303133,
                                ))
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(16.px, 6.px, 0, 0),
                          child: Text(
                              !isOn
                                  ? "362324********6010"
                                  : "362324199610016010",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.px,
                                fontWeight: FontWeight.bold,
                                color: color_FF606266,
                              )))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.px, 0, 16.px, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8.px),
                        child: Image(
                            width: 24.px,
                            height: 24.px,
                            image: const AssetImage(
                                "assets/images/route_code/ylz_qrcode_bright.png"),
                            fit: BoxFit.cover),
                      ),
                      InkWell(
                        child: Text("亲友亮码",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18.px,
                              fontWeight: FontWeight.bold,
                              color: HiColorCodeBlue,
                            )),
                        onTap: () {
                          // this.clickNum = this.clickNum + 1;
                          // if (this.clickNum > 2) {
                          //   this.clickNum = 0;
                          // }
                          // widget.routeCodeCellInfoWidgetClickListener(this.clickNum);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: const HiSeparatorView(color: color_FFCECECE),
            height: 1.0.px,
          ),
        ],
      ),
    );
  }
}
