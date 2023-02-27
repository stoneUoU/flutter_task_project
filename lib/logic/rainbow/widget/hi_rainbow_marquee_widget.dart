import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_carousel_model.dart';

// ignore: must_be_immutable
class HiRainbowMarqueeWidget extends StatefulWidget {
  List newLists = [];
  HiRainbowMarqueeWidget({Key? key, required this.newLists}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HiRainbowMarqueeWidget createState() => _HiRainbowMarqueeWidget();
}

class _HiRainbowMarqueeWidget extends State<HiRainbowMarqueeWidget> {
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: ScreenW(context) - 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: color_FFF5F5F5,
          border: Border.all(
            color: color_FFF5F5F5,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Image.asset('assets/images/rainbow/fastReport.png'),
            ),
            const SizedBox(
              height: 30,
              //这个跑马灯我看很强:
              child: Text("AAAAA"),
              // child: FlutterMarquee(
              //     onChange: (i) {},
              //     duration: 4,
              //     children: _makeMarquee(widget.newLists)),
            )
          ],
        ));
  }

  List<Widget> _makeMarquee(List newLists) {
    List<Widget> widgetList = [];
    for (var i = 0; i < newLists.length; i++) {
      NewsList newsList = newLists[i];
      widgetList.add(Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: ScreenW(context) - 30.0 - 45.0 - 30,
          alignment: Alignment.centerLeft,
          child: Text(
            newsList.news ?? "",
            style: const TextStyle(color: Colors.black, fontSize: 14),
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )));
    }
    return widgetList;
  }
}
