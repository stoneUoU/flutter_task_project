import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiMineHeaderWidget extends StatelessWidget {
  const HiMineHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenW(context),
      height: 154.px,
      child: Stack(
        children: [
          Container(
              width: ScreenW(context),
              height: 126.px,
              child: Image.asset('assets/images/mine/ylz_mine_bg.png',
                  fit: BoxFit.fill)),
          Positioned(
            child: Container(
              width: 120.px,
              height: 44.px,
              padding: EdgeInsets.only(top: 10.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: InkWell(
                      child: Image.asset(
                          'assets/images/mine/ylz_mine_notice.png',
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16.px),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(3.0.px)),
                    ),
                    width: 6.px,
                    height: 6.px,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16.px),
                    child: InkWell(
                      child: Image.asset('assets/images/mine/ylz_mine_scan.png',
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ),
            right: 0,
            top: 0,
          ),
          Positioned(
            child: Card(
              elevation: 15.px,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.0.px)),
                ),
                width: ScreenW(context) - 32.px,
                height: 94.px,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16.px),
                      child: Row(
                        children: [
                          Image.asset(
                              'assets/images/mine/ylz_mine_male_avater.png',
                              fit: BoxFit.fill),
                          Container(
                            margin: EdgeInsets.only(left: 16.px),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 6.0.px),
                                  child: Text(
                                    "157****4505",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: color_FF303133,
                                        fontSize: 20.px,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                        'assets/images/mine/ylz_mine_real_sign.png',
                                        fit: BoxFit.fill),
                                    Text(
                                      " 已实人认证",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: color_FF1B65B9,
                                        fontSize: 14.px,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16.px),
                      child: Image.asset(
                          'assets/images/common/ylz_arrow_right.png',
                          fit: BoxFit.fill),
                    )
                  ],
                ),
              ),
            ),
            left: 12.px,
            bottom: 0,
          )
        ],
      ),
    );
  }
}
