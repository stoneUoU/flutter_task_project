import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/logic/mine/model/hi_mine_model.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiMineListWidget extends StatelessWidget {
  HiMineModel? model;
  HiMineListWidget({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.px),
                child: Image.asset(
                    "assets/images/mine/${model!.picUrl ?? ""}.png",
                    fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  model!.title ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: color_FF303133,
                    fontSize: 16.px,
                  ),
                ),
              )
            ],
          ),
          Image.asset('assets/images/common/ylz_arrow_right.png',
              fit: BoxFit.fill),
        ],
      ),
    );
  }
}
