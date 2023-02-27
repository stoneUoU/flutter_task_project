import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef OnBannerClickListener = void Function(int index, dynamic itemData);
typedef BuildShowView = Widget Function(int index, dynamic itemData);

class HiRainbowPhotoWidget extends StatefulWidget {
  final OnBannerClickListener onBannerClickListener;
  final List data;
  final BuildShowView buildShowView;
  final ValueChanged<int> onPageChanged;

  const HiRainbowPhotoWidget({
    Key? key,
    required this.data,
    required this.buildShowView,
    required this.onBannerClickListener,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new HiRainbowPhotoWidgetState();
}

class HiRainbowPhotoWidgetState extends State<HiRainbowPhotoWidget> {
  var pageController;
  HiRainbowPhotoWidgetState() {}

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.data.length);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: widget.data.length == 0
            ? null
            : GestureDetector(
                onTap: () {
                  widget.onBannerClickListener(pageController.page.round(),
                      widget.data[pageController.page.round()]);
                },
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: widget.onPageChanged,
                  physics:
                      const PageScrollPhysics(parent: ClampingScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) {
                    return widget.buildShowView(index, widget.data[index]);
                  },
                  itemCount: widget.data.length,
                ),
              ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
