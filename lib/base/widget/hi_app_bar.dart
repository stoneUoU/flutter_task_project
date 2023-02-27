import 'package:flutter/material.dart';

///自定义顶部appBar
HiAppBar(Color bgColor, Color backButtonColor, String title, Color titleColor,
    String rightTitle, VoidCallback rightButtonClick) {
  return AppBar(
    //让title居左
    backgroundColor: bgColor,
    centerTitle: false,
    titleSpacing: 0,
    leading: BackButton(
      color: backButtonColor,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 18, color: titleColor),
    ),
    actions: [
      InkWell(
        onTap: rightButtonClick,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: Text(
            rightTitle,
            style: TextStyle(fontSize: 18, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
  );
}
