import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiRouteCodeCellLoadingWidget extends StatelessWidget {
  const HiRouteCodeCellLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224.px,
      color: Colors.white,
      width: ScreenW(context) - 48.px,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 54.px),
            child: Image(
                width: 54.px,
                height: 54.px,
                image: const AssetImage(
                    "assets/images/route_code/ylz_qrcode_m_logo.png"),
                fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.only(top: 32.px),
            child: InkWell(
              child: Text("点击出示健康码",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24.px,
                    fontWeight: FontWeight.bold,
                    color: HiColorCodeBlue,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
