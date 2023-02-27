import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

import 'code_view/hi_route_code_cell_bottom_widget.dart';
import 'code_view/hi_route_code_cell_info_widget.dart';
import 'code_view/hi_route_code_cell_state_widget.dart';

class HiRouteCodeStateCell extends StatefulWidget {
  const HiRouteCodeStateCell({Key? key}) : super(key: key);
  @override
  _HiRouteCodeStateCellState createState() => _HiRouteCodeStateCellState();
}

class _HiRouteCodeStateCellState extends State<HiRouteCodeStateCell> {
  GlobalKey<HiRouteCodeCellStateWidgetState> routeCodeWidgetStateKey =
      GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 556.px,
      margin: EdgeInsets.fromLTRB(24.px, 0, 24.px, 0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          HiRouteCodeCellInfoWidget(
            routeCodeCellInfoWidgetClickListener: (int idStr) {
              this.generateClickNum(idStr);
            },
          ),
          HiRouteCodeCellStateWidget(key: this.routeCodeWidgetStateKey),
          const HiRouteCodeCellBottomWidget()
        ],
      ),
    );
  }

  void generateClickNum(int intString) {
    this.routeCodeWidgetStateKey.currentState?.generateClickNum(intString);
  }
}
