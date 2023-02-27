import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_feeds_model.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_box_label_widget.dart';

class HiRainbowDesignerNoPhotoCell extends StatefulWidget {
  Rs rs;
  HiRainbowDesignerNoPhotoCell({Key? key, required this.rs}) : super(key: key);

  @override
  _HiRainbowDesignerNoPhotoCellState createState() =>
      _HiRainbowDesignerNoPhotoCellState();
}

class _HiRainbowDesignerNoPhotoCellState
    extends State<HiRainbowDesignerNoPhotoCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenW(context) - 30,
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          children: <Widget>[
            _makeTopView(widget.rs),
            _makeCenterView(),
            _makeBottomView(widget.rs),
          ],
        ));
  }

  Widget _makeTopView(Rs rs) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 45.0,
          height: 45.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22.5),
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/rainbow/avater_icon.png",
              image: rs.headImage ?? "",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: ScreenW(context) - 30.0 - 60.0,
                  child: Text(
                    "${widget.rs.userName}",
                    style: const TextStyle(color: color_FFF3F3F3, fontSize: 14),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: ScreenW(context) - 30.0 - 60.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${widget.rs.city}",
                          style: const TextStyle(
                              color: color_FFF3F3F3, fontSize: 14),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${widget.rs.priceUnit}" == ""
                              ? ""
                              : "服务：${widget.rs.priceUnit}",
                          style: const TextStyle(
                              color: color_FFF3F3F3, fontSize: 14),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget _makeCenterView() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
      width: ScreenW(context) - 30.0,
      height: 1,
      color: color_FFF3F3F3,
    );
  }

  Widget _makeBottomView(Rs rs) {
    if (rs.title == "") {
      return Container(
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: HiRainbowBoxLabelWidget(boxStr: "设计师"));
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              width: ScreenW(context) - 30.0,
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
                child: HiRainbowBoxLabelWidget(boxStr: "设计师")),
          ],
        ),
      );
    }
  }
}
