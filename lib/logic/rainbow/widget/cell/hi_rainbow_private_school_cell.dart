import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_feeds_model.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_box_label_widget.dart';

typedef void OnPrivateSchoolCellClickListener(String idStr);

class HiRainbowPrivateSchoolCell extends StatefulWidget {
  Rs rs;
  final OnPrivateSchoolCellClickListener onPrivateSchoolCellClickListener;
  HiRainbowPrivateSchoolCell(
      {Key? key,
      required this.rs,
      required this.onPrivateSchoolCellClickListener})
      : super(key: key);

  @override
  _HiRainbowPrivateSchoolCellState createState() =>
      _HiRainbowPrivateSchoolCellState();
}

class _HiRainbowPrivateSchoolCellState
    extends State<HiRainbowPrivateSchoolCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPrivateSchoolCellClickListener("${widget.rs.dataID}");
      },
      child: Container(
//	    color: Color(STColors.colorC06),
        width: ScreenW(context) - 30,
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: _makeCol(widget.rs),
      ),
    );
  }

  Column _makeCol(Rs rs) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: ScreenW(context) - 30.0,
          height: _makePhotoHeight(rs),
          child: FadeInImage.assetNetwork(
            placeholder: "assets/images/rainbow/placeSite.jpg",
            fadeInDuration: const Duration(seconds: 1), // 持续时间，默认 700 ms
            image: rs.bigImg ?? "",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          width: ScreenW(context) - 30.0,
          child: Text(
            "${rs.title}",
            style: const TextStyle(color: color_FF7a7a7a, fontSize: 16),
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: HiRainbowBoxLabelWidget(boxStr: _makeBoxStr(widget.rs))),
      ],
    );
  }

  double _makePhotoHeight(Rs rs) {
    if (rs.type == 1 && rs.type == 2) {
      return (ScreenW(context) - 30) * (rs.imgWidth ?? 0) / (rs.imgHeight ?? 1);
    } else if (rs.type == 11) {
      return (ScreenW(context) - 30) * 265 / 375;
    }
    {
      return (ScreenW(context) - 30) * 3 / 5;
    }
  }

  String _makeBoxStr(Rs rs) {
    if (rs.type == 1) {
      return "设计作品";
    } else if (rs.type == 2) {
      return "设计案例";
    } else if (rs.type == 5) {
      return "策划案";
    } else if (rs.type == 6) {
      return "作品私馆";
    } else if (rs.type == 10) {
      return "主题元素";
    } else {
      return "设计报告";
    }
  }
}
