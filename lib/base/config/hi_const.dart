import 'package:flutter/material.dart';

double NaviH = kToolbarHeight;

double TabBarH = kBottomNavigationBarHeight;

const String RainBowUrl = "https://api.chdesign.cn";

/** 获取屏幕宽度 */
double ScreenW(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/** 获取屏幕高度 */
double ScreenH(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/** 获取系统状态栏高度 */
double StatusH(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

/**  Tabbar safe bottom margin */
double TabbarSafeBottomM(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}
