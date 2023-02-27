import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:flutter_task_project/base/widget/hi_progress_dialog.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_report_model.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_photo_widget.dart';

class HiRainbowReportDetailPage extends StatefulWidget {
  int reportId;
  //构造函数
  HiRainbowReportDetailPage({Key? key, required this.reportId})
      : super(key: key);

  @override
  _HiRainbowReportDetailPageState createState() =>
      _HiRainbowReportDetailPageState();
}

class _HiRainbowReportDetailPageState extends State<HiRainbowReportDetailPage> {
  List<String> imageLists = [];
  bool flag = true;
  final EasyRefreshController _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: false,
  );
  HiRainbowReportModel renderMs = HiRainbowReportModel();

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getBody());
  }

  _showLoadingDialog() {
    //在此处加载进度条
    if (renderMs.reportId == null) {
      return true;
    }
    return false;
  }

  _getBody() {
    if (_showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                  height: ScreenH(context) - 50 - TabbarSafeBottomM(context),
                  child: EasyRefresh(
                    controller: _controller,
                    header: const ClassicHeader(),
                    footer: const ClassicFooter(),
                    onRefresh: () async {},
                    child: _getListView(),
                  )),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 0.0,
                child: _makeStatusAndNaviBar(),
              ),
            ],
          ),
          _makeFooterView(),
        ],
      );
//			return _makeFooterView();
    }
  }

//
  Widget _makeStatusAndNaviBar() {
    return Container(
        width: ScreenW(context),
        height: StatusH(context) + kToolbarHeight,
        child: Container(
          margin: EdgeInsets.fromLTRB(15.0, StatusH(context), 15.0, 0),
          width: ScreenW(context) - 30.0,
          height: kToolbarHeight,
          child: Stack(children: <Widget>[
            Align(
              alignment: FractionalOffset.centerLeft,
              child: GestureDetector(
                onTap: () {
                  // 按下
                  Navigator.pop(context, "哈哈哈");
                },
                child: Image.asset('assets/images/clickBack.png'),
              ),
            ),
            Align(
              alignment: FractionalOffset.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset('assets/images/clickBack.png'),
              ),
            ),
          ]),
        ));
  }

  ListView _getListView() => ListView.builder(
        itemCount: 3,
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            return _makeTopView();
          } else if (position == 1) {
            return _makeCenterView();
          } else {
            return _makeBottomView();
          }
        },
      );

  Widget _makeTopView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 265,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: ScreenW(context), //- 30.0,
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/rainbow/placeSite.jpg",
              fadeInDuration: const Duration(seconds: 1), // 持续时间，默认 700 ms
              image: renderMs.cover ?? "",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 12.0, 37.0, 0),
            width: ScreenW(context) - 52.0,
            child: Text(renderMs.title ?? "",
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                textAlign: TextAlign.left),
          ),
          _makeSubTitleView(renderMs.title ?? ""),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 4.0, 15.0, 0),
            width: ScreenW(context) - 30.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Text("￥${renderMs.salePrice}" + "/份  ",
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.red),
                          textAlign: TextAlign.left),
                      Text(
                        "￥${renderMs.salePrice}",
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                          decorationColor: Colors.black54, //线的颜色
                          decoration: TextDecoration
                              .lineThrough, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text("全国包邮",
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      textAlign: TextAlign.right),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 15.0),
              width: ScreenW(context) - 30.0,
              height: flag ? 50.0 : 40.0,
              color: color_FF21232A,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(6.0, 0, 0, 0),
                      child: Text(
                        flag
                            ? "尊贵的全球设计通会员\n您可以全年免费自选5份报告"
                            : "加入全球设计通，全年免费自选5份报告",
                        style: const TextStyle(
                            fontSize: 12.0, color: color_FFFF3F56),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 6.0, 0),
                      child: Text(flag ? "咨询客服 >" : "了解详情 > ",
                          style: const TextStyle(
                              fontSize: 14.0, color: color_FFFF3F56),
                          textAlign: TextAlign.right),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _makeSubTitleView(String subTitleStr) {
    if (subTitleStr == "") {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 2.0, 39.0, 0),
      width: ScreenW(context) - 54.0,
      child: Text(subTitleStr,
          style: const TextStyle(fontSize: 14.0, color: Colors.black54),
          textAlign: TextAlign.left),
    );
  }

  Widget _makeCenterView() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
            width: ScreenW(context) - 30.0,
            child: Row(
              children: <Widget>[
                Container(width: 3.0, height: 21, color: color_FFF3F3F3),
                Container(
                  margin: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
                  child: const Text("报告亮点",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: color_FFF3F3F3,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
            width: ScreenW(context) - 30.0,
            child: Text(renderMs.description ?? "",
                style: const TextStyle(fontSize: 16.0, color: color_FF7a7a7a),
                textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }

  Widget _makeBottomView() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            width: ScreenW(context) - 30.0,
//						color: Colors.red,
            child: Row(
              children: <Widget>[
                Container(width: 3.0, height: 21, color: color_FFF3F3F3),
                Container(
                  margin: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
                  child: const Text("报告介绍",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: color_FFF3F3F3,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
            width: ScreenW(context) - 30.0,
            child: Container(),
//             child: Html(
//               data: renderMs.ex,
//               backgroundColor: Colors.white70,
//               defaultTextStyle: TextStyle(fontFamily: 'serif'),
//               onLinkTap: (url) {
//                 // open url in a webview
//               },
//               customRender: (node, children) {
//                 if (node is dom.Element) {
//                   switch (node.localName) {
//                     case "img":
//                       {
//                         RegExp reg = new RegExp("src=" "([^" "]+)" " ");
//                         Match m = reg.firstMatch(node.outerHtml);
//                         String imgStr =
//                             "${node.outerHtml.substring(m.start + 5, m.end - 2)}";
//                         imageLists.add(imgStr);
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     //builder: (context) => PhotoView(data: null, buildShowView: null)
// //                                        PhotoView(
// //                                        backgroundDecoration: const BoxDecoration(
// //                                          color: Colors.black87,
// //                                        ),
// //                                        imageProviders: List.generate(5, (gi){
// //                                          return CachedNetworkImageProvider("https://picsum.photos/350/500?image=${gi}");
// //                                        }).toList(),
// //                                        index: 0,
// //                                      ),
//                                     ));
// //                                    int index=getNewList(imageLists).indexOf("${imgStr}");
// //                                    print(getNewList(imageLists));
// //                                    showDialog<Null>(
// //                                      context: context,
// //                                      barrierDismissible: false,
// //                                      builder: (BuildContext context) {
// //                                        return _makePhotoView(getNewList(imageLists),index);
// //                                      },
// //                                    ).then((val) {
// //                                      print(val);
// //                                    });
//                             print(
//                                 "________${node.outerHtml.substring(m.start + 5, m.end - 2)}");
//                           },
//                           child: Image.network(
//                               "${node.outerHtml.substring(m.start + 5, m.end - 2)}"),
//                         );
//                       }
//                   }
//                 }
//               },
          ),
        ],
      ),
    );
  }

  Widget _makePhotoView(List list, int index) {
    return Container(
        child: HiRainbowPhotoWidget(
      data: list,
      onPageChanged: onPageChanged,
      buildShowView: (index, itemData) {
        return FadeInImage(
            placeholder: AssetImage("images/1.jpg"),
            image: NetworkImage(list[index]));
      },
      onBannerClickListener: (index, itemData) {
        Navigator.pop(context);
      },
    )
        //Image.network(list[index]),
        );
  }

  void onPageChanged(int index) {
    if (mounted) {
      setState(() {});
    }
  }

  //去掉list中重复的数据:
  List<String> getNewList(List<String> li) {
    List<String> list = [];
    for (int i = 0; i < li.length; i++) {
      String str = li[i];
      if (!list.contains(str)) {
        list.add(str);
      }
    }
    return list; //返回集合
  }

  Widget _makeFooterView() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return _makeShareView();
                      });
                },
                child: const Text(
                  "咨询客服",
                  style: TextStyle(fontSize: 16.0, color: color_FF999999),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    "预订报告",
                    style: TextStyle(fontSize: 16.0, color: color_FF999999),
                  ),
                  onPressed: () {},
                )),
          ),
        ],
      ),
    );
  }

  Widget _makeShareView() {
    return SizedBox(
      height: 180,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: _makeIconBottomView(Icons.call, 'QQ'), flex: 1),
              Expanded(child: _makeIconBottomView(Icons.chat, '微信'), flex: 1),
              Expanded(
                  child: _makeIconBottomView(Icons.add_alarm, '朋友圈'), flex: 1),
              Expanded(child: _makeIconBottomView(Icons.share, '微博'), flex: 1)
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _makeIconBottomView(Icons.call, 'QQ'), flex: 1),
              Expanded(child: _makeIconBottomView(Icons.chat, '微信'), flex: 1),
              Expanded(
                  child: _makeIconBottomView(Icons.add_alarm, '朋友圈'), flex: 1),
              Expanded(child: _makeIconBottomView(Icons.share, '微博'), flex: 1)
            ],
          ),
          Container(
            height: 32,
            width: ScreenW(context),
            color: Colors.transparent,
          )
        ],
      ),
    );
  }

  Container _makeIconBottomView(IconData icon, String lab) {
    Color color = Theme.of(context).primaryColor;
    return Container(
        height: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            Text(
              lab,
              style: TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            )
          ],
        ));
  }

  // Future<Null> _loadData() async {
  //   String url = "/Exhibition/GetReportDetail";
  //   var data = {"reportId": widget.reportId, "userId": "9"};
  //   var response = await HttpUtil().post(url, data: data);
  //   if (response["flag"] == 1) {
  //     if (mounted) {
  //       setState(() {
  //         try {
  //           this.renderMs = new DesignReportMs.fromJSON(response["rs"]);
  //         } catch (e) {
  //           print(e);
  //         }
  //       });
  //     }
  //   } else {
  //     print(response);
  //   }
  // }

  // _pullRefresh() {
  //   Future.delayed(const Duration(seconds: 5), () => _loadData());
  // }
}
