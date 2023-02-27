import 'package:flutter_task_project/net/http/request/hi_base_request.dart';

class HiRainbowReportDetailRequest extends HiBaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "/Exhibition/GetReportDetail";
  }
}
