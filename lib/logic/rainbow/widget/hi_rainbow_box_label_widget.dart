import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';

class HiRainbowBoxLabelWidget extends StatefulWidget {
  String boxStr = "";
  HiRainbowBoxLabelWidget({Key? key, required this.boxStr}) : super(key: key);

  @override
  _HiRainbowBoxLabelWidgetState createState() =>
      _HiRainbowBoxLabelWidgetState();
}

class _HiRainbowBoxLabelWidgetState extends State<HiRainbowBoxLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return _makeBoxView(widget.boxStr);
  }

  Widget _makeBoxView(String boxStr) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
            width: 4.0,
            height: 18.0,
            color: color_FF7a7a7a,
          ),
          Container(
            height: 18.0,
            padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: color_FF7a7a7a,
                  width: 1.0,
                )),
            child: Center(
              child: Text(
                boxStr,
                style: TextStyle(color: color_FF7a7a7a, fontSize: 11),
              ),
            ),
          )
        ],
      ),
    );
  }
}
