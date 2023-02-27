import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

import 'code_view/hi_route_code_cell_bottom_widget.dart';
import 'code_view/hi_route_code_cell_info_widget.dart';
import 'code_view/hi_route_code_cell_loading_widget.dart';

class HiRouteCodeLoadingCell extends StatelessWidget {
  const HiRouteCodeLoadingCell({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.px,
      margin: EdgeInsets.fromLTRB(24.px, 0, 24.px, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0.px))),
      child: Column(
        children: [
          HiRouteCodeCellInfoWidget(
              routeCodeCellInfoWidgetClickListener: (int idStr) {
            print("${idStr}");
          }),
          HiRouteCodeCellLoadingWidget(),
          HiRouteCodeCellBottomWidget()
        ],
      ),
    );
  }
}
