import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/navigator/hi_navigator.dart';
import 'package:flutter_task_project/base/widget/hi_highlight_icon_button.dart';
import 'package:flutter_task_project/base/widget/hi_info_alert_dialog.dart';
import 'package:flutter_task_project/base/widget/hi_version_alert_dialog.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class HiHomePage extends StatefulWidget {
  const HiHomePage({Key? key}) : super(key: key);

  @override
  _HiHomePageState createState() => _HiHomePageState();
}

class _HiHomePageState extends State<HiHomePage>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = new ScrollController();
  _HiHomePageState() {
    _alertLuck();
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  void _alertLuck() {
    Future.delayed(Duration(seconds: 0), () {
      showDialog(
          context: context,
          // 点击背景区域是否可以关闭
          barrierDismissible: false,
          builder: (BuildContext context) {
            return HiInfoAlertDialog(
              data: "集五福 福同享",
              closeCallback: () {
                print("集五福 福同享");
                // _alertVersion();
              },
              successCallback: () {
                print("集五福 福同享---");
                HiNavigator().onJumpTo(RouteStatus.hiWeb, args: {
                  "urlString":
                      "https://render.alipay.com/p/yuyan/180020570000002340-prod/index.html"
                });
              },
            );
          });
    });
  }

  void _alertVersion() {
    Future.delayed(Duration(seconds: 0), () {
      showDialog(
          context: context,
          // 点击背景区域是否可以关闭
          barrierDismissible: false,
          builder: (BuildContext context) {
            return HiVersionAlertDialog(data: "更新弹窗", closeCallback: () {});
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            HiHomeNavigationWidget(context: context),
            Expanded(
              child: Container(
                color: Colors.white,
                child: CustomScrollView(
                  slivers: _setUpSliverWidgets(),
                  reverse: false,
                  controller: _scrollController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _setUpSliverWidgets() {
    List<Widget> widgetLists = [];
    widgetLists.add(_HiHomeElecCardGrid());
    widgetLists.add(_HiHomeToppingQueryGrid());
    widgetLists.add(_HiHomeAuthorGrid());
    widgetLists.add(_HiHomeMedicalInsuranceQueryGrid());
    widgetLists.add(_HiHomeCarouselGrid());
    widgetLists.add(_HiHomeMarqueeGrid());
    widgetLists.add(_HiHomeCopyRightGrid());
    return widgetLists;
  }
}

class _HiHomeElecCardGrid extends StatelessWidget {
  const _HiHomeElecCardGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        sticky: false,
        header: Container(),
        sliver: SliverPadding(
          padding: EdgeInsets.all(8.0.px),
          sliver: _buildSliverGrid(context), //SliverGrid和GridView类似)
          //一组sliver类型的小部件
        ));
  }

  SliverGrid _buildSliverGrid(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width - 16.px);
    double desiredCellHeight = 160.px;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 8.0.px,
          mainAxisSpacing: 8.0.px,
          childAspectRatio: childAspectRatio),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InkWell(
            child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.px)),
                    ),
                    width: cellWidth,
                    height: desiredCellHeight,
                    child: Image.asset('assets/images/home/home_top_bg.png',
                        fit: BoxFit.fill)),
                Positioned(
                  child: Container(
                    width: cellWidth,
                    height: desiredCellHeight,
                    alignment: Alignment.center,
                    child: Text("易  联  众  民  生 \n Flutter  框  架",
                        style: TextStyle(
                            fontSize: 24.0.px,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.left),
                  ),
                  left: 0,
                  top: 0,
                )
              ],
            ),
            onTap: () {
              HiNavigator().onJumpTo(RouteStatus.routeCode);
            },
          );
        },
        childCount: 1,
      ),
    );
  }
}

class _HiHomeToppingQueryGrid extends StatelessWidget {
  const _HiHomeToppingQueryGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        sticky: false,
        header: Container(),
        sliver: SliverPadding(
          padding: EdgeInsets.all(8.0.px),
          sliver: _buildSliverGrid(context), //SliverGrid和GridView类似)
          //一组sliver类型的小部件
        ));
  }

  SliverGrid _buildSliverGrid(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width - 32.px) / 4;
    double desiredCellHeight = 72.px;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0.px,
          mainAxisSpacing: 8.0.px,
          childAspectRatio: childAspectRatio),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InkWell(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: 32.px,
                    height: 32.px,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.0.px)),
                      color: Color.fromRGBO(Random().nextInt(256),
                          Random().nextInt(256), Random().nextInt(256), 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.px),
                    child: Text(
                      "民生科技",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: color_FF606266, fontSize: 12.px),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {},
          );
        },
        childCount: 8,
      ),
    );
  }
}

class _HiHomeAuthorGrid extends StatelessWidget {
  const _HiHomeAuthorGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        sticky: false,
        header: Container(),
        sliver: SliverPadding(
          padding: EdgeInsets.fromLTRB(16.0.px, 0, 16.0.px, 0),
          sliver: _buildSliverGrid(context), //SliverGrid和GridView类似)
          //一组sliver类型的小部件
        ));
  }

  SliverGrid _buildSliverGrid(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width - 32.px);
    double desiredCellHeight = 50.px;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 0.0.px,
          mainAxisSpacing: 0.0.px,
          childAspectRatio: childAspectRatio),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Stack(
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0.px))),
                  width: cellWidth,
                  height: desiredCellHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.green,
                        width: 120.px,
                        height: desiredCellHeight,
                      ),
                      Container(
                        child: Image.asset('assets/images/home/home_area.png',
                            fit: BoxFit.fill),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16.px),
                        child: Image.asset('assets/images/home/home_go.png',
                            fit: BoxFit.fill),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  HiNavigator().onJumpTo(RouteStatus.healthCode);
                },
              ),
              Positioned(
                  top: 15.px,
                  right: 36.px,
                  child: Text(
                    "易联众民生科技 作者：Stone",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: color_FF303133, fontSize: 12.px),
                  )),
            ],
          );
        },
        childCount: 1,
      ),
    );
  }
}

class _HiHomeMedicalInsuranceQueryGrid extends StatelessWidget {
  const _HiHomeMedicalInsuranceQueryGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        sticky: false,
        header: Container(
          height: 54.px,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 16),
          child: Text(
            "医保查询服务",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: color_FF303133,
                fontSize: 18.px,
                fontWeight: FontWeight.w700),
          ),
        ),
        sliver: SliverPadding(
          padding: EdgeInsets.fromLTRB(16.px, 0, 16.px, 16.0.px),
          sliver: _buildSliverGrid(context), //SliverGrid和GridView类似)
          //一组sliver类型的小部件
        ));
  }

  SliverGrid _buildSliverGrid(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width - 32.px) / 2;
    double desiredCellHeight = 50.px;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0.px,
          mainAxisSpacing: 16.0.px,
          childAspectRatio: childAspectRatio),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0.px)),
                color: color_FFF5F7FA),
            width: cellWidth,
            height: desiredCellHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 32.px,
                  height: 32.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0.px)),
                    color: Color.fromRGBO(Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256), 1),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
                    child: Text(
                      "民生科技",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: color_FF606266, fontSize: 12.px),
                      maxLines: 3,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}

class _HiHomeCarouselGrid extends StatelessWidget {
  const _HiHomeCarouselGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        sticky: false,
        header: Container(),
        sliver: SliverPadding(
          padding: EdgeInsets.fromLTRB(16.0.px, 0, 16.0.px, 16.px),
          sliver: _buildSliverGrid(context), //SliverGrid和GridView类似)
          //一组sliver类型的小部件
        ));
  }

  SliverGrid _buildSliverGrid(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width - 32.px);
    double desiredCellHeight = 88.px;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 0.0.px,
          mainAxisSpacing: 0.0.px,
          childAspectRatio: childAspectRatio),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          List<String> carousels = [
            "https://p0.meituan.net/moviemachine/855eba69586a2272838b0904107596df71498.jpg",
            "https://p0.meituan.net/movie/1266d74b35daf438c04506f0f9f90a3e976963.jpg"
          ];
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0.px))),
            width: cellWidth,
            height: desiredCellHeight,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0.px),
                      topRight: Radius.circular(10.0.px))),
              child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0.px),
                            topRight: Radius.circular(10.0.px)),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/home/home_empty.png",
                          image: carousels[index],
                          fit: BoxFit.cover,
                        ));
                  },
                  // viewportFraction: 0.8,
                  // scale: 0.9,
                  onTap: (index) {},
                  autoplay: true,
                  itemCount: carousels.length,
                  loop: true,
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomRight,
                      builder: DotSwiperPaginationBuilder(
                          activeColor: color_FF4272e0))),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }
}

class _HiHomeMarqueeGrid extends StatelessWidget {
  const _HiHomeMarqueeGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        sticky: false,
        header: Container(),
        sliver: SliverPadding(
          padding: EdgeInsets.fromLTRB(16.0.px, 0, 16.0.px, 16.px),
          sliver: _buildSliverGrid(context), //SliverGrid和GridView类似)
          //一组sliver类型的小部件
        ));
  }

  SliverGrid _buildSliverGrid(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width - 32.px);
    double desiredCellHeight = 59.px;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 0.0.px,
          mainAxisSpacing: 0.0.px,
          childAspectRatio: childAspectRatio),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0.px)),
                color: color_FFF5F7FA),
            width: cellWidth,
            height: desiredCellHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 72.px,
                  height: desiredCellHeight,
                  decoration: const BoxDecoration(
                      color: color_FFEFF4FB,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          "民生",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: color_FF4272e0,
                              fontSize: 14.px,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "科技",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: color_FF303133,
                              fontSize: 14.px,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
                    width: ScreenUtils.screenW() - 136.px,
                    height: desiredCellHeight,
                    child: Swiper(
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      loop: true,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                "民生科技",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: color_FF4272e0,
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                "易联众民生Flutter 框架",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: color_FF606266,
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        );
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(right: 16.px),
                  child: Image.asset('assets/images/home/home_go.png',
                      fit: BoxFit.fill),
                )
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }
}

class _HiHomeCopyRightGrid extends StatelessWidget {
  const _HiHomeCopyRightGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
        sticky: false,
        header: Container(),
        sliver: SliverPadding(
          padding: EdgeInsets.fromLTRB(16.0.px, 0, 16.0.px, 16.px),
          sliver: _buildSliverGrid(context), //SliverGrid和GridView类似)
          //一组sliver类型的小部件
        ));
  }

  SliverGrid _buildSliverGrid(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width - 32.px);
    double desiredCellHeight = 32.px;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 0.0.px,
          mainAxisSpacing: 0.0.px,
          childAspectRatio: childAspectRatio),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              "易联众（民生）科技出品",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: color_FF303133,
                  fontSize: 12.px,
                  fontWeight: FontWeight.w500),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }
}

class HiHomeNavigationWidget extends StatelessWidget {
  const HiHomeNavigationWidget({Key? key, required this.context})
      : super(key: key);
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.screenW(),
      height: ScreenUtils.navigationBarHeight(),
      color: Colors.white,
      child: Column(
        children: [
          Container(
              width: ScreenUtils.screenW(), height: ScreenUtils.padTopH()),
          Stack(children: [
            Container(
                width: ScreenUtils.screenW(),
                height: kToolbarHeight,
                alignment: Alignment.center,
                child: const Text("易联众民生",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            Positioned(
                right: 16,
                top: 12,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16.px),
                      child: HiHighLightIconButton(
                        onTap: () {},
                        iconSize: Size(28.px, 28.px),
                        imageName: 'assets/images/home/home_notice.png',
                        iconColor: Colors.black,
                      ),
                    ),
                    HiHighLightIconButton(
                      onTap: () {},
                      iconSize: Size(28.px, 28.px),
                      imageName: 'assets/images/home/home_scan.png',
                      iconColor: Colors.black,
                    ),
                  ],
                ))
          ])
        ],
      ),
    );
  }
}
