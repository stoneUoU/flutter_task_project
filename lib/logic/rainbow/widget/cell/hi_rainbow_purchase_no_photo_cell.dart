import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_feeds_model.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_box_label_widget.dart';

class HiRainbowPurchaseNoPhotoCell extends StatefulWidget {
  Rs rs;
  HiRainbowPurchaseNoPhotoCell({Key? key, required this.rs}) : super(key: key);
  @override
  _HiRainbowPurchaseNoPhotoCellState createState() =>
      _HiRainbowPurchaseNoPhotoCellState();
}

class _HiRainbowPurchaseNoPhotoCellState
    extends State<HiRainbowPurchaseNoPhotoCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenW(context) - 30,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: ScreenW(context) - 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: ScreenW(context) - 30 - 100,
                  child: Text(
                    "${widget.rs.title}",
                    style: const TextStyle(color: color_FF7a7a7a, fontSize: 16),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _buildMidView(widget.rs),
                HiRainbowBoxLabelWidget(boxStr: "采购需求"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMidView(Rs rs) {
    return Container(
      width: ScreenW(context) - 30,
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                    text: "项目预算:",
                    style: TextStyle(
                      color: color_FF999999,
                      fontSize: 14,
                    )),
                TextSpan(
                  text: "${widget.rs.budget}元左右",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Text(
              "${widget.rs.time}截止报名",
              style: const TextStyle(color: color_FF999999, fontSize: 14),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
