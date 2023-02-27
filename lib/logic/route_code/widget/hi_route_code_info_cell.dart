import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/logic/route_code/model/hi_function_model.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

// ignore: must_be_immutable
class HiRouteCodeInfoCell extends StatelessWidget {
  HiFunctionModel? funcModel;
  HiRouteCodeInfoCell({Key? key, this.funcModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (funcModel!.topFillet ?? false) {
      return funcTopFilletContanier();
    } else if (funcModel?.bottomFillet ?? false) {
      return funcBottomFilletContanier();
    } else {
      return funcCommonContanier();
    }
  }

  Widget funcTopFilletContanier() {
    return Container(
      margin: EdgeInsets.fromLTRB(24.px, 0, 24.px, 0),
      height: 64.px,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0.px),
            topRight: Radius.circular(12.0.px)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 63.5.px,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
                    height: 32.px,
                    width: 32.px,
                    child: Image(
                        image: AssetImage(funcModel?.iconName ?? ""),
                        fit: BoxFit.cover)),
                Text("${funcModel?.functionName ?? ""}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.px,
                      fontWeight: FontWeight.bold,
                      color: color_FF303133,
                    ))
              ])),
          Container(color: color_FFCECECE, height: 0.5.px)
        ],
      ),
    );
  }

  Widget funcCommonContanier() {
    return Container(
      margin: EdgeInsets.fromLTRB(24.px, 0, 24.px, 0),
      height: 64.px,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 63.5.px,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
                    height: 32.px,
                    width: 32.px,
                    child: Image(
                        image: AssetImage(funcModel?.iconName ?? ""),
                        fit: BoxFit.cover)),
                Text("${funcModel?.functionName ?? ""}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.px,
                      fontWeight: FontWeight.bold,
                      color: color_FF303133,
                    ))
              ])),
          Container(color: color_FFCECECE, height: 0.5.px)
        ],
      ),
    );
  }

  Widget funcBottomFilletContanier() {
    return Container(
      margin: EdgeInsets.fromLTRB(24.px, 0, 24.px, 0),
      height: 64.px,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0.px),
            bottomRight: Radius.circular(12.0.px)),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
            height: 32.px,
            width: 32.px,
            child: Image(
                image: AssetImage(funcModel?.iconName ?? ""),
                fit: BoxFit.cover)),
        Text("${funcModel?.functionName ?? ""}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24.px,
              fontWeight: FontWeight.bold,
              color: color_FF303133,
            ))
      ]),
    );
  }
}
