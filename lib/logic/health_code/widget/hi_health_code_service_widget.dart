import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_service_cell_widget.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiHealthCodeServiceWidget extends StatelessWidget {
  const HiHealthCodeServiceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenW(context),
      height: 256.px,
      child: Container(
          width: ScreenW(context),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(new Radius.circular(10.0.px)),
          ),
          margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16.px, 16.px, 0, 16.px),
                child: Text(
                  "相关服务",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24.px,
                    fontWeight: FontWeight.w500,
                    color: color_FF303133,
                  ),
                ),
              ),
              Expanded(child: HiHealthCodeServiceCellWidget())
            ],
          )),
    );
  }
}
