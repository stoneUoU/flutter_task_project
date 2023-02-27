import 'package:dio/dio.dart';
import 'package:flutter_task_project/net/http/core/hi_net_adapter.dart';
import 'package:flutter_task_project/net/http/core/hi_net_error.dart';
import 'package:flutter_task_project/net/http/request/hi_base_request.dart';

///Dio适配器
class HiDioAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(HiBaseRequest request) async {
    var response, options = Options(headers: request.header);
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        print("request.url_______${request.url()}");
        print("request.params_______${request.params}");
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await Dio()
            .delete(request.url(), data: request.params, options: options);
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }
    if (error != null) {
      ///抛出HiNetError
      throw HiNetError(response?.statusCode ?? -1, error.toString(),
          data: buildRes(response, request));
    }
    return buildRes(response, request);
  }

  ///构建HiNetResponse
  HiNetResponse<T> buildRes<T>(Response response, HiBaseRequest request) {
    return HiNetResponse(
        data: response.data,
        request: request,
        statusCode: response.statusCode!,
        statusMessage: response.statusMessage!,
        extra: response);
  }
}
