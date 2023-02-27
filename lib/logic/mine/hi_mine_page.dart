import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/logic/mine/model/hi_mine_model.dart';
import 'package:flutter_task_project/logic/mine/widget/hi_mine_elec_widget.dart';
import 'package:flutter_task_project/logic/mine/widget/hi_mine_header_widget.dart';
import 'package:flutter_task_project/logic/mine/widget/hi_mine_list_widget.dart';
import 'package:flutter_task_project/logic/mine/widget/hi_mine_member_widget.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiMinePage extends StatefulWidget {
  const HiMinePage({Key? key}) : super(key: key);

  @override
  _HiMinePageState createState() => _HiMinePageState();
}

class _HiMinePageState extends State<HiMinePage>
    with AutomaticKeepAliveClientMixin {
  List<HiMineModel> modelList = [
    HiMineModel.fromJson(
        {"picUrl": "ylz_mine_list_info", "title": "个人基本信息", "indexTag": 0}),
    HiMineModel.fromJson(
        {"picUrl": "ylz_mine_list_notice", "title": "消息中心", "indexTag": 0}),
    HiMineModel.fromJson(
        {"picUrl": "ylz_mine_list_help", "title": "帮助与反馈", "indexTag": 0}),
    HiMineModel.fromJson(
        {"picUrl": "ylz_mine_list_about", "title": "关于", "indexTag": 0}),
    HiMineModel.fromJson(
        {"picUrl": "ylz_mine_list_setting", "title": "设置", "indexTag": 0}),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: color_FF1B65B9,
            width: ScreenW(context),
            height: StatusH(context),
          ),
          HiMineHeaderWidget(),
          Expanded(
              child: Container(
            child: CustomScrollView(
              slivers: [
                _StickyHeaderList(index: 0),
                _StickyHeaderList(index: 1),
                _StickyHeaderList(
                  index: 2,
                  modelList: modelList,
                )
              ],
              reverse: false,
            ),
          ))
        ],
      ),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _StickyHeaderList extends StatelessWidget {
  GlobalKey<State>? stateKey = GlobalKey();
  _StickyHeaderList({Key? key, this.index, this.modelList}) : super(key: key);
  final int? index;
  List<HiMineModel>? modelList;
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      sticky: false,
      header: Container(
        color: color_FFF5F5F5,
        width: ScreenW(context),
        height: index == 0 ? 0 : 10.px,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            if (index == 0) {
              return HiMineElecWidget();
            } else if (index == 1) {
              return HiMineMemberWidget();
            } else {
              return HiMineListWidget(model: modelList?[i]);
            }
          },
          childCount: index == 2 ? modelList?.length : 1,
        ),
      ),
    );
  }
}
