import 'package:flutter_task_project/net/http/request/hi_base_request.dart';

class HiRainbowFeedsRequest extends HiBaseRequest {
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
    return "/2.0.0/User/DataRecommendationList";
  }
}
