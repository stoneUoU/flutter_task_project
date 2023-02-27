import 'package:flutter_task_project/net/http/core/hi_net.dart';
import 'package:flutter_task_project/net/http/request/hi_base_request.dart';
import 'package:flutter_task_project/net/http/request/rainbow/hi_rainbow_report_detail_request.dart';
import 'package:flutter_task_project/net/http/request/rainbow/hi_rainbow_report_request.dart';

class HiRianbowReportDao {
  static fetchReport(int pageIndex, int pageSize) {
    return _sendReport(pageIndex, pageSize);
  }

  static fetchReportDetail(int reportId) {
    return _sendReportDetail(reportId);
  }

  static _sendReport(int pageIndex, int pageSize) async {
    HiBaseRequest request;
    request = HiRainbowReportRequest();
    request.add("pageIndex", pageIndex);
    request.add("pageSize", pageSize);
    var result = await HiNet().fire(request);
    return result;
  }

  static _sendReportDetail(int reportId) async {
    HiBaseRequest request;
    request = HiRainbowReportDetailRequest();
    request.add("reportId", reportId);
    request.add("userId", 9);
    var result = await HiNet().fire(request);
    return result;
  }
}
