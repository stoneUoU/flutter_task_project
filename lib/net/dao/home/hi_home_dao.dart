import 'package:flutter_task_project/logic/home/model/hi_home_navigator_model.dart';
import 'package:flutter_task_project/net/http/core/hi_net.dart';
import 'package:flutter_task_project/net/http/request/hi_base_request.dart';
import 'package:flutter_task_project/net/http/request/home/hi_home_request.dart';

class MGHomeDao {
  static navigator() {
    return _sendNavigator();
  }

  static _sendNavigator() async {
    HiBaseRequest request;
    List<HiHomeNavigatorModel> list = [];
    request = HiHomeRequest();
    var result = await HiNet().fire(request);
    print("result======${result}");
    for (int index = 0; index < result.length; index++) {
      HiHomeNavigatorModel model = HiHomeNavigatorModel.fromJson(result[index]);
      list.add(model);
    }
    return list;
  }
}
