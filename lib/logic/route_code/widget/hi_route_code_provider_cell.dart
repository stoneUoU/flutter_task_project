import 'package:flutter/material.dart';
import 'package:flutter_task_project/provider/hi_route_code_provider.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:provider/provider.dart';

import 'code_view/hi_route_code_cell_bottom_widget.dart';
import 'code_view/hi_route_code_cell_info_widget.dart';
import 'code_view/hi_route_code_cell_provider_widget.dart';

class HiRouteCodeProviderCell extends StatelessWidget {
  const HiRouteCodeProviderCell({Key? key}) : super(key: key);
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
              // print("${idString}");
              context.read<HiRouteCodeProvider>().setClickNum(idStr);
            },
          ),
          HiRouteCodeCellProviderWidget(),
          const HiRouteCodeCellBottomWidget()
        ],
      ),
    );
  }
}
