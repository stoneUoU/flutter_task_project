import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_check_widget.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_info_widget.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_navigation_widget.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_provider_widget.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_service_widget.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_source_widget.dart';
import 'package:flutter_task_project/logic/health_code/widget/hi_health_code_widget.dart';
import 'package:flutter_task_project/provider/hi_health_code_provider.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';

class HiHealthCodePage extends StatefulWidget {
  const HiHealthCodePage({Key? key}) : super(key: key);
  @override
  _HiHealthCodePageState createState() => _HiHealthCodePageState();
}

class _HiHealthCodePageState extends State<HiHealthCodePage>
    with SingleTickerProviderStateMixin {
  GlobalKey<HiHealthCodeWidgetState> healthCodeWidgetStateKey = GlobalKey();

  late AnimationController controller;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    controller = AnimationController(
        duration: const Duration(seconds: 1),
        lowerBound: 1.0,
        upperBound: 1.5,
        vsync: this);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
      } else if (status == AnimationStatus.dismissed) {
        print("status is dismissed");
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
      } else if (status == AnimationStatus.reverse) {
        print("status is reverse");
      }
    });

    const timeout = const Duration(seconds: 1);
    this.timer = Timer.periodic(timeout, (timer) {
      if (!mounted) return;
      if (controller.isCompleted) {
        controller.reverse();
      } else {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this.timer.cancel();
    this.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: Column(
        children: [
          HiHealthCodeNavigationWidget(
              titleString: "福建八闽健康码",
              clickListener: (int index) {
                print("关闭闽政通展码页");
                Navigator.pop(context);
              }),
          Expanded(
            child: Container(
                color: HiColorMZTBlueView,
                child: CustomScrollView(
                  slivers: [
                    _HiHealthCodeListWidget(
                        index: 0,
                        clickListener: (int clickNum) {
                          this.generateClickNum(clickNum);
                        }),
                    _HiHealthCodeListWidget(
                      index: 1,
                      stateKey: this.healthCodeWidgetStateKey,
                      controller: controller,
                    ),
                    _HiHealthCodeListWidget(index: 2),
                    _HiHealthCodeListWidget(index: 3),
                    _HiHealthCodeListWidget(index: 4)
                  ],
                  reverse: false,
                )),
          )
        ],
      ),
    );
  }

  void generateClickNum(int intString) {
    this.healthCodeWidgetStateKey.currentState?.generateClickNum(intString);
  }
}

typedef void _HiHealthCodeListWidgetClickListener(int intString);

class _HiHealthCodeListWidget extends StatelessWidget {
  GlobalKey<State>? stateKey = GlobalKey();
  AnimationController? controller;
  _HiHealthCodeListWidgetClickListener? clickListener;
  _HiHealthCodeListWidget(
      {Key? key,
      this.index,
      this.stateKey,
      this.controller,
      this.clickListener})
      : super(key: key);
  final int? index;
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: Container(
        color: HiColorMZTBlueView,
        height: index == 0 || index == 1 ? 0 : 12,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            if (index == 0) {
              return HiHealthCodeInfoWidget(
                  healthCodeInfoWidgetClickListener: (int intString) {
                // if (this.clickListener != null) {
                //   this.clickListener!(intString);
                // }
                context.read<HiHealthCodeProvider>().setClickNum(intString);
              });
            } else if (index == 1) {
              // return HiHealthCodeWidget(stateKey!, controller!);
              return HiHealthCodeProviderWidget(controller: controller!);
            } else if (index == 2) {
              return HiHealthCodeCheckWidget();
            } else if (index == 3) {
              return HiHealthCodeServiceWidget();
            } else {
              return HiHealthCodeSourceWidget();
            }
          },
          childCount: 1,
        ),
      ),
    );
  }
}
