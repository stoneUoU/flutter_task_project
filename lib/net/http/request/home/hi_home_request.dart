import 'package:flutter_task_project/net/http/request/hi_base_request.dart';

class HiHomeRequest extends HiBaseRequest {
  int pathCategory = 0;

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
    return "/provide/home_nav";
  }
}
