import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/base/navigator/hi_navigator.dart';
import 'package:flutter_task_project/base/widget/hi_progress_dialog.dart';
import 'package:flutter_task_project/logic/rainbow/delegate/hi_rainbow_fixheader_delegate.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_carousel_model.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_feeds_model.dart';
import 'package:flutter_task_project/logic/rainbow/widget/cell/hi_rainbow_design_real_stuff_cell.dart';
import 'package:flutter_task_project/logic/rainbow/widget/cell/hi_rainbow_designer_no_photo_cell.dart';
import 'package:flutter_task_project/logic/rainbow/widget/cell/hi_rainbow_designer_photo_cell.dart';
import 'package:flutter_task_project/logic/rainbow/widget/cell/hi_rainbow_private_school_cell.dart';
import 'package:flutter_task_project/logic/rainbow/widget/cell/hi_rainbow_purchase_no_photo_cell.dart';
import 'package:flutter_task_project/logic/rainbow/widget/cell/hi_rainbow_purchase_photo_cell.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_horizontal_widget.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_marquee_widget.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_swiper_widget.dart';
import 'package:flutter_task_project/net/dao/rainbow/hi_rainbow_dao.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HiRainbowHomePage extends StatefulWidget {
  //构造函数
  const HiRainbowHomePage({Key? key}) : super(key: key);
  @override
  _HiRainbowHomePageState createState() => _HiRainbowHomePageState();
}

class _HiRainbowHomePageState extends State<HiRainbowHomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  List dataLists = [
    {
      "index": 0,
      "picStr": "images/rainbow/findDesigner.png",
      "textStr": "找设计师"
    },
    {
      "index": 1,
      "picStr": "images/rainbow/designReport.png",
      "textStr": "设计报告"
    },
    {
      "index": 2,
      "picStr": "images/rainbow/findDesigner.png",
      "textStr": "找设计师"
    },
    {
      "index": 3,
      "picStr": "images/rainbow/privateSchool.png",
      "textStr": "作品私馆"
    },
    {
      "index": 4,
      "picStr": "images/rainbow/planningCase.png",
      "textStr": "看策划案"
    },
    {
      "index": 5,
      "picStr": "images/rainbow/findDesigner.png",
      "textStr": "找设计师"
    },
    {"index": 6, "picStr": "images/rainbow/designCourse.png", "textStr": "设计课"},
  ];
  late Future _fetchBuilderFuture;
  int _pageIndex = 2;
  List<Rs> loadMoreRs = [];
  List<Map<String, dynamic>> loadMoreJson = [];
  final EasyRefreshController _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!mounted) return;
    _fetchBuilderFuture = _sendRequest(_pageIndex, true);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: FutureBuilder(
            future: _fetchBuilderFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                HiRainBowCarouselModel rotationMs =
                    HiRainBowCarouselModel.fromJson(snapshot.data[0]["rs"]);
                HiRainbowFeedsModel feedsModel =
                    HiRainbowFeedsModel.fromJson(snapshot.data[1]);
                return returnSliverView(rotationMs, feedsModel);
              } else {
                return Center(child: getProgressDialog());
              }
            }));
  }

  Widget returnSliverView(
      HiRainBowCarouselModel rotationMs, HiRainbowFeedsModel feedsModel) {
    return SizedBox(
        width: ScreenW(context),
        height: ScreenH(context) -
            kBottomNavigationBarHeight -
            TabbarSafeBottomM(context),
        child: EasyRefresh(
          controller: _controller,
          header: const ClassicHeader(),
          footer: const ClassicFooter(),
          onRefresh: () async {
            setState(() {
              _pageIndex = 1;
              _fetchBuilderFuture = _sendRequest(_pageIndex, true);
            });
          },
          onLoad: () async {
            setState(() {
              _pageIndex++;
              _fetchBuilderFuture = _sendRequest(_pageIndex, false);
            });
          },
          child: CustomScrollView(
            slivers: _buildSlivers(context, rotationMs, feedsModel),
          ),
        ));
  }

  List<Widget> _buildSlivers(BuildContext context,
      HiRainBowCarouselModel rotationMs, HiRainbowFeedsModel feedsModel) {
    List<Widget> slivers = <Widget>[];
    slivers.add(_makeTopHeader(context, rotationMs));
    for (int index = 0; index < (feedsModel.rs?.length ?? 0); index++) {
      slivers.add(_makeFixedHeader(context));
      slivers.addAll(_buildLists(context, 0, index, feedsModel));
    }
    return slivers;
  }

  List<Widget> _buildLists(BuildContext context, int firstIndex, int count,
      HiRainbowFeedsModel feedsModel) {
    return List.generate(1, (sliverIndex) {
      sliverIndex += firstIndex;
      return SliverStickyHeader(
        header: _buildHeader(sliverIndex),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) => InkWell(
                onTap: () {}, child: _makeCustomerCell(i, count, feedsModel)),
            childCount: 1,
          ),
        ),
      );
    });
  }

  Widget _makeCustomerCell(int i, int count, HiRainbowFeedsModel feedsModel) {
    Rs listRs = feedsModel.rs![count];
    if (listRs.type == 6 ||
        listRs.type == 1 ||
        listRs.type == 2 ||
        listRs.type == 5 ||
        listRs.type == 10 ||
        listRs.type == 11) {
      return HiRainbowPrivateSchoolCell(
        rs: listRs,
        onPrivateSchoolCellClickListener: (String str) {
          if (listRs.type == 11) {}
        },
      );
    } else if (listRs.type == 3) {
      if (listRs.listImg?.length == 3) {
        return HiRainbowDesignerPhotoCell(rs: listRs);
      } else {
        return HiRainbowDesignerNoPhotoCell(rs: listRs);
      }
    } else if (listRs.type == 4) {
      return HiRainbowDesignRealStuffCell(rs: listRs);
    } else if (listRs.type == 9) {
      if (listRs.bigImg?.isEmpty ?? false) {
        return HiRainbowPurchaseNoPhotoCell(rs: listRs);
      } else {
        return HiRainbowPurchasePhotoCell(rs: listRs);
      }
    } else {
      return Container(
        height: 64,
        color: color_FF4dab69,
      );
    }
  }

  Widget _buildHeader(int index, {String? text}) {
    return Container();
  }

  Widget _makeFixedHeader(BuildContext context) {
    return SliverPersistentHeader(
        pinned: false,
        delegate: HiRainbowFixHeaderDelegate(
            10.0,
            10.0,
            Container(
              height: 10.0,
              color: color_FFF3F3F3,
            )));
  }

  Widget _makeTopHeader(
      BuildContext context, HiRainBowCarouselModel rotationMs) {
    List<NewsList> newsLists = rotationMs?.newsList ?? [];
    return SliverPersistentHeader(
        pinned: false,
        delegate: HiRainbowFixHeaderDelegate(
            295.0,
            295.0,
            Column(
              children: <Widget>[
                HiRainbowSwiperWidget(
                  dataList: const [
                    "https://p0.meituan.net/moviemachine/855eba69586a2272838b0904107596df71498.jpg",
                    "https://p0.meituan.net/movie/1266d74b35daf438c04506f0f9f90a3e976963.jpg"
                  ],
                ),
                HiRainBowHorizontalWidget(
                  dataList: dataLists,
                  onHorizontalViewClickListener: (int index) {
                    // if (index == 1) {
                    // } else {}
                    HiNavigator().onJumpTo(RouteStatus.rainbowReport,
                        args: {"reportId": 1});
                  },
                ),
                HiRainbowMarqueeWidget(
                  newLists: newsLists,
                ),
              ],
            )));
  }

  Future _sendRequest(int pageIndex, bool ifFresh) async {
    var carousel = await HiRainbowDao.fetchCarousel();
    var feed = await HiRainbowDao.fetchFeeds(pageIndex);
    if (ifFresh) {
      if (int.parse(feed["UpdateCount"].toString()) > 0) {
        Fluttertoast.showToast(
            msg: "成功为您更新${feed["UpdateCount"].toString()}条推荐");
      } else {
        Fluttertoast.showToast(msg: "暂无更新");
      }
    }
    loadMoreRs.clear();
    if (ifFresh) {
      List resRs = feed["rs"];
      for (var i = 0; i < resRs.length; i++) {
        Rs lastRs = Rs.fromJson(resRs[i]);
        loadMoreRs.add(lastRs);
      }
    } else {
      loadMoreJson.clear();
      List resRs = feed["rs"];
      for (var i = 0; i < resRs.length; i++) {
        Rs lastRs = Rs.fromJson(resRs[i]);
        loadMoreRs.add(lastRs);
      }
    }
    for (var i = 0; i < loadMoreRs.length; i++) {
      Rs lastRs = loadMoreRs[i];
      Map<String, dynamic> resStr = lastRs.toJson();
      loadMoreJson.add(resStr);
    }
    feed["rs"] = loadMoreJson;
    return [carousel, feed];
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
