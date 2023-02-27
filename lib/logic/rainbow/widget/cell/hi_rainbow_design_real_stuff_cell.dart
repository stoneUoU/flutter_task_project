import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_feeds_model.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_box_label_widget.dart';

class HiRainbowDesignRealStuffCell extends StatefulWidget {
  Rs rs;

  HiRainbowDesignRealStuffCell({Key? key, required this.rs}) : super(key: key);
  @override
  _HiRainbowDesignRealStuffCellState createState() =>
      _HiRainbowDesignRealStuffCellState();
}

class _HiRainbowDesignRealStuffCellState
    extends State<HiRainbowDesignRealStuffCell> {
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _buildMidView(widget.rs),
                HiRainbowBoxLabelWidget(boxStr: "设计干货"),
              ],
            ),
          ),
          Positioned(right: 0, top: 0, child: _buildIMV(widget.rs))
        ],
      ),
    );
  }

  Widget _buildMidView(Rs rs) {
    return Container(
      width: ScreenW(context) - 30 - 100,
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              "${rs.cateName}",
              style: const TextStyle(color: color_FF999999, fontSize: 14),
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "${rs.hits}" == "" ? "" : "阅读：${widget.rs.hits}",
              style: const TextStyle(color: color_FF999999, fontSize: 14),
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
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
