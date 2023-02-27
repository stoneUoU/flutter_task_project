import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_feeds_model.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_box_label_widget.dart';

class HiRainbowPurchasePhotoCell extends StatefulWidget {
  Rs rs;
  HiRainbowPurchasePhotoCell({Key? key, required this.rs}) : super(key: key);
  @override
  _HiRainbowPurchasePhotoCellState createState() =>
      _HiRainbowPurchasePhotoCellState();
}

class _HiRainbowPurchasePhotoCellState
    extends State<HiRainbowPurchasePhotoCell> {
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
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Text(
                    "${widget.rs.time}截止报名",
                    style: const TextStyle(color: color_FF999999, fontSize: 14),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                HiRainbowBoxLabelWidget(boxStr: "采购需求"),
              ],
            ),
          ),
          Positioned(right: 0, top: 0, child: _buildIMV(widget.rs))
        ],
      ),
    );
  }

  Widget _buildIMV(Rs rs) {
    return SizedBox(
      width: 100.0,
      height: 75,
      child: FadeInImage.assetNetwork(
        placeholder: "assets/images/rainbow/placeSite.jpg",
        fadeInDuration: const Duration(seconds: 1), // 持续时间，默认 700 ms
        image: "${rs.bigImg}".isEmpty ? "" : "${rs.bigImg}",
        fit: BoxFit.cover,
      ),
    );
  }
}
