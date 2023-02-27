import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_report_model.dart';
import 'package:url_launcher/url_launcher.dart';
//flutter闭包与android类似的

typedef OnHomeItemClickListener = void Function(num reportId);

class HiRainbowReportCell extends StatelessWidget {
  final OnHomeItemClickListener onHomeItemClickListener;

  final HiRainbowReportModel reportModel;

  const HiRainbowReportCell(
      {Key? key,
      required this.onHomeItemClickListener,
      required this.reportModel})
      : super(key: key);

  void _launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 按下
        onHomeItemClickListener(reportModel.reportId ?? 0);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: 265,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: ScreenW(context), //- 30.0,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/rainbow/placeSite.jpg",
                  fadeInDuration: const Duration(seconds: 1), // 持续时间，默认 700 ms
                  image: reportModel.cover ?? "",
                  fit: BoxFit.cover,
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: ScreenW(context),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 8.0),
                    width: ScreenW(context) - 30.0 - 80.0,
                    child: Text(
                      reportModel.title ?? "",
                      style:
                          const TextStyle(color: Colors.black, fontSize: 15.0),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 8.0, 15.0, 8.0),
//										color:Colors.greenAccent,
                    width: 80.0,
                    child: Text(
                      "￥${reportModel.salePrice}/元",
                      style: TextStyle(color: Colors.red, fontSize: 15.0),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 8.0),
              width: ScreenW(context) - 30.0,
              child: Text(
                reportModel.description ?? "",
                style: const TextStyle(color: Colors.black54, fontSize: 12.0),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
                width: ScreenW(context), height: 10, color: color_FFF5F5F5)
          ],
        ),
      ),
    );
  }
}
