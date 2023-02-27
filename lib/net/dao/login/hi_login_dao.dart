import 'package:flutter_task_project/net/http/core/hi_net.dart';
import 'package:flutter_task_project/net/http/request/hi_base_request.dart';
import 'package:flutter_task_project/net/http/request/login/hi_login_request.dart';

class HiLoginDao {
  static login(String userName, String userPwd) {
    return _sendLogin(userName, userPwd);
  }

  static register(
      String userName, String userPwd, String code, String inviteCode) {
    return _sendRegister(userName, userPwd, code, inviteCode);
  }

  static registerSmsCode(String userName) {
    return _sendRegisterSmsCode(userName);
  }

  static forgetPwd(String userName, String userPwd, String code) {
    return _sendForgetPwd(userName, userPwd, code);
  }

  static forgetPwdSmsCode(String userName) {
    return _sendForgetPwdSmsCode(userName);
  }

  static _sendLogin(String userName, String userPwd) async {
    HiBaseRequest request;
    request = HiLoginRequest();
    request.add("user_name", userName);
    request.add("user_pwd", userPwd);
    var result = await HiNet().fire(request);
    return result;
  }

  static _sendRegister(
      String userName, String userPwd, String code, String inviteCode) async {
    HiLoginRequest request;
    request = HiLoginRequest();
    request.pathCategory = 1;
    request.add("user_name", userName);
    request.add("user_pwd", userPwd);
    request.add("code", code);
    request.add("invite_code", inviteCode);
    var result = await HiNet().fire(request);
    return result;
  }

  static _sendRegisterSmsCode(String userName) async {
    HiLoginRequest request;
    request = HiLoginRequest();
    request.pathCategory = 2;
    request.add("user_name", userName);
    var result = await HiNet().fire(request);
    return result;
  }

  static _sendForgetPwdSmsCode(String userName) async {
    HiLoginRequest request;
    request = HiLoginRequest();
    request.pathCategory = 3;
    request.add("user_name", userName);
    var result = await HiNet().fire(request);
    return result;
  }

  static _sendForgetPwd(String userName, String userPwd, String code) async {
    HiLoginRequest request;
    request = HiLoginRequest();
    request.pathCategory = 4;
    request.add("user_name", userName);
    request.add("user_pwd", userPwd);
    request.add("code", code);
    var result = await HiNet().fire(request);
    return result;
  }
}
