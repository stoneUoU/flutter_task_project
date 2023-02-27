import 'package:flutter_task_project/net/http/request/hi_base_request.dart';

import 'hi_net_adapter.dart';

///测试适配器，mock数据
class HiMockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(HiBaseRequest request) {
    return Future<HiNetResponse<T>>.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: {"code": 0, "message": 'success'} as T,
          request: request,
          statusCode: 403,
          statusMessage: "鉴权失败");
    });
  }
}
