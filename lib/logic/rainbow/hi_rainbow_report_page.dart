import 'dart:convert';
import 'dart:io';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/helpers/hi_net_helper.dart';
import 'package:flutter_task_project/base/navigator/hi_navigator.dart';
import 'package:flutter_task_project/base/widget/hi_placeholder_view.dart';
import 'package:flutter_task_project/base/widget/hi_progress_dialog.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_banner_model.dart';
import 'package:flutter_task_project/logic/rainbow/model/hi_rainbow_report_model.dart';
import 'package:flutter_task_project/logic/rainbow/widget/cell/hi_rainbow_report_cell.dart';
import 'package:flutter_task_project/logic/rainbow/widget/hi_rainbow_report_banner_widget.dart';
import 'package:flutter_task_project/net/dao/rainbow/hi_rainbow_report_dao.dart';

class HiRainbowReportPage extends StatefulWidget {
  const HiRainbowReportPage({Key? key, required this.reportId})
      : super(key: key);
  final int reportId;
  @override
  State<HiRainbowReportPage> createState() => _HiRainbowReportPageState();
}

class _HiRainbowReportPageState extends State<HiRainbowReportPage> {
  List widgets = [];
  List<HiRainbowBannerSonModel> mResult = [];
  final int _pageSize = 10;
  int _pageIndex = 1;
  bool netFlag = true;
  final EasyRefreshController _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  @override
  void initState() {
    super.initState();
    _sendRequest(true, false);
  }

  @override
  void dispose() {
    super.dispose();
    print('移除时：dispose');
  }

  _showLoadingDialog() {
    if (widgets.isEmpty) {
      return true;
    }
    return false;
  }

  getBody() {
    if (!netFlag) {
      return HiPlaceHolderView(
          viewType: HiPlaceHolderViewType.noNetwork,
          onPlaceHolderViewClickListener: (viewType) {
            if (viewType == HiPlaceHolderViewType.noNetwork) {
              // _sendNet();
            } else if (viewType == HiPlaceHolderViewType.noGoods) {
              print("images/noShopCart.png");
            } else {
              print("images/noShopCart.png");
            }
          });
    } else {
      if (_showLoadingDialog()) {
        return getProgressDialog();
      } else {
        return EasyRefresh(
          controller: _controller,
          header: const ClassicHeader(),
          footer: const ClassicFooter(),
          onRefresh: () async {
            _pageIndex = 1;
            _sendRequest(true, false);
          },
          onLoad: () async {
            _pageIndex = _pageIndex + 1;
            _sendRequest(false, true);
          },
          child: getListView(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: const <Widget>[
          Expanded(
              child: Center(
            child: Text("设计报告"),
          ))
        ],
      )),
      body: getBody(),
    );
  }

  ListView getListView() => ListView.builder(
        itemCount: widgets.length + 1,
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            return _makeCarousel();
          } else {
            return getRow(position);
          }
        },
      );

  Widget getRow(int i) {
    HiRainbowReportModel reportModel = widgets[i != 0 ? i - 1 : 0];
    return _makeList(reportModel);
  }

  Widget _makeCarousel() {
    if (mResult.isEmpty) {
      return Container();
    }
    return Container(
        height: 160,
        child: HiRainbowReportBannerWidget(carouselChildMs: mResult));
  }

  Widget _makeList(HiRainbowReportModel reportModel) {
    return HiRainbowReportCell(
      reportModel: reportModel,
      onHomeItemClickListener: (reportId) {
        HiNavigator()
            .onJumpTo(RouteStatus.rainbowReport, args: {"reportId": 1});
      },
    );
  }

  /*
        * 存储数据
        */
  // Future _setPreference(String accountStr) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString('accountStr', accountStr);
  //   print('存储accountStr为:$accountStr');
  // }
  //
  // /*
  //     * 读取数据
  //     */
  // Future<String> _getPreference() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   Object accountStr = preferences.get('accountStr') ?? "";
  //   return accountStr.toString();
  // }

  Future _sendRequest(bool freshBanner, bool ifLoad) async {
    HiNetHelper netHelper = new HiNetHelper();
    netHelper.checkInternet((netUseful) async {
      if (!netUseful) {
        if (!mounted) return;
        setState(() {
          netFlag = false;
        });
      } else {
        netFlag = true;
        if (freshBanner) {
          _sendBannerRequest();
        }
        var reports =
            await HiRianbowReportDao.fetchReport(_pageIndex, _pageSize);
        if (reports["flag"] == 1) {
          if (!ifLoad) {
            widgets.clear();
            _controller.finishRefresh();
          } else {
            _controller.finishLoad();
          }
        }
        setState(() {
          for (int i = 0; i < reports["rs"].length; i++) {
            HiRainbowReportModel cellData =
                HiRainbowReportModel.fromJson(reports["rs"][i]);
            widgets.add(cellData);
          }
        });
      }
    });
  }

  Future _sendBannerRequest() async {
    var url = 'http://www.wanandroid.com/banner/json';
    var httpClient = new HttpClient();
    List<HiRainbowBannerSonModel>? result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var resJson = await response.transform(utf8.decoder).join();
        result = HiRainbowBannerModel.fromJson(json.decode(resJson)).data;
      }
      if (!mounted) return;
      setState(() {
        mResult = result!;
      });
      request.close();
    } catch (exception) {
      result = null;
    }
  }
}
