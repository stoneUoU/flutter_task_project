import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';

//flutter闭包与android类似的
enum HiPlaceHolderViewType {
  noNetwork, // 0
  noGoods, // 1
  noOrders, // 2
}

typedef OnPlaceHolderViewClickListener = void Function(
    HiPlaceHolderViewType viewType);

class HiPlaceHolderView extends StatelessWidget {
  final HiPlaceHolderViewType viewType;

  final OnPlaceHolderViewClickListener onPlaceHolderViewClickListener;

  String picStr = "";

  String tipsStr = "";

  String btnStr = "";

  HiPlaceHolderView(
      {Key? key,
      required this.onPlaceHolderViewClickListener,
      required this.viewType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //先设置图片、文字
    _setStr();
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Center(child: Image.asset(picStr)),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Center(
            child: Text(tipsStr,
                style: const TextStyle(fontSize: 16.0, color: color_FF303133),
                textAlign: TextAlign.center),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB((ScreenW(context) - 200) / 2, 30,
              (ScreenW(context) - 200) / 2, 0),
          height: 45,
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              if (onPlaceHolderViewClickListener != null) {
                onPlaceHolderViewClickListener(viewType);
              }
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    side: BorderSide())),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0.0)),
            child: Text(btnStr,
                style: const TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
        )
      ],
    );
  }

  _setStr() {
    if (viewType == HiPlaceHolderViewType.noNetwork) {
      picStr = "images/noNet.png";
    } else if (viewType == HiPlaceHolderViewType.noGoods) {
      picStr = "images/noShopCart.png";
    } else {
      picStr = "images/noShopCart.png";
    }

    if (viewType == HiPlaceHolderViewType.noNetwork) {
      tipsStr = "亲，网络不佳丫";
    } else if (viewType == HiPlaceHolderViewType.noGoods) {
      tipsStr = "暂无订单";
    } else {
      tipsStr = "暂无订单";
    }

    if (viewType == HiPlaceHolderViewType.noNetwork) {
      btnStr = "点击重试";
    } else if (viewType == HiPlaceHolderViewType.noGoods) {
      btnStr = "重新加载";
    } else {
      btnStr = "重新加载";
    }
  }
}
