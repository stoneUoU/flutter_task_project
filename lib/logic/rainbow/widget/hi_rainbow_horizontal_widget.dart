import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';

//flutter闭包与android类似的

typedef OnHorizontalViewClickListener = void Function(int index);

class HiRainBowHorizontalWidget extends StatelessWidget {
  List dataList = [];
  final OnHorizontalViewClickListener onHorizontalViewClickListener;
  HiRainBowHorizontalWidget(
      {Key? key,
      required this.dataList,
      required this.onHorizontalViewClickListener})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ScreenW(context),
        height: 70.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int position) {
            return _makeContainer(context, dataList[position]["picStr"],
                dataList[position]["textStr"], dataList[position]["index"]);
          },
        ));
  }

  GestureDetector _makeContainer(
      BuildContext context, String picStr, String textStr, int index) {
    return GestureDetector(
      onTap: () {
        onHorizontalViewClickListener(index);
      },
      child: SizedBox(
          width: ScreenW(context) / 5,
          height: 70.0,
          child: Center(
              child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                child: Image.asset('assets/$picStr'),
              ),
              Text(
                  style: const TextStyle(fontSize: 12.0, color: color_00000010),
                  textStr,
                  textAlign: TextAlign.left),
            ],
          ))),
    );
  }

//找设计师   设计报告   主题元素   作品私馆   看策划案  设计干货  贸易对接  设计课
}
