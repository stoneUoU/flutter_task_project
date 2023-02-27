import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';

class HiRainbowSwiperWidget extends StatefulWidget {
  List dataList = [];
  HiRainbowSwiperWidget({Key? key, required this.dataList}) : super(key: key);
  @override
  _HiRainbowSwiperWidget createState() => _HiRainbowSwiperWidget();
}

class _HiRainbowSwiperWidget extends State<HiRainbowSwiperWidget> {
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenW(context),
      height: 175,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          String newBannerList = widget.dataList[index];
          return FadeInImage.assetNetwork(
            placeholder: "assets/images/placeSite.jpg",
            fadeInDuration: const Duration(seconds: 1), // 持续时间，默认 700 ms
            image: "${newBannerList.toString()}",
            fit: BoxFit.cover,
          );
        },
        autoplay: true,
        itemCount: widget.dataList.length,
        loop: true,
        pagination: const SwiperPagination(),
      ),
    );
  }
}
