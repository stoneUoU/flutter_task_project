import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/logic/mine/widget/hi_mine_member_cell_image_widget.dart';
import 'package:flutter_task_project/logic/mine/widget/hi_mine_member_cell_label_widget.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiMineMemberWidget extends StatefulWidget {
  const HiMineMemberWidget({Key? key}) : super(key: key);

  @override
  _HiMineMemberWidgetState createState() => _HiMineMemberWidgetState();
}

class _HiMineMemberWidgetState extends State<HiMineMemberWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("我的家庭成员   ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: color_FF303133,
                          fontSize: 16.px,
                        )),
                    Text("(1/5)",
                        style: TextStyle(
                          color: color_FF1B65B9,
                          fontSize: 16.px,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '管理亲情账户  ',
                      style: const TextStyle(
                        color: color_FF303133,
                      ),
                    ),
                    Image.asset(
                      'assets/images/common/ylz_arrow_right.png',
                      width: 12.px,
                      height: 12.px,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 96.px,
            margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return HiMineMemberCellLabelWidget();
                } else if (index == 1) {
                  return HiMineMemberCellImageWidget(
                    isPlace: false,
                  );
                } else {
                  return HiMineMemberCellImageWidget(
                    isPlace: true,
                  );
                }
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
