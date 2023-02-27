import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_banner_model.dart';

class HiRainbowReportBannerWidget extends StatefulWidget {
  List<HiRainbowBannerSonModel> carouselChildMs;
  HiRainbowReportBannerWidget({Key? key, required this.carouselChildMs})
      : super(key: key);
  @override
  _HiRainbowReportBannerWidgetState createState() =>
      _HiRainbowReportBannerWidgetState();
}

class _HiRainbowReportBannerWidgetState
    extends State<HiRainbowReportBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenW(context),
      height: 160,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) =>
            FadeInImage.assetNetwork(
          placeholder: "assets/images/rainbow/placeSite.jpg",
          fadeInDuration: const Duration(seconds: 1),
          // 持续时间，默认 700 ms
          image: widget.carouselChildMs[index].imagePath.toString(),
          fit: BoxFit.cover,
        ),
        duration: 5,
        autoplay: true,
        itemCount: widget.carouselChildMs.length,
        loop: true,
        pagination: const SwiperPagination(alignment: Alignment.bottomRight),
      ),
    );
  }
}
