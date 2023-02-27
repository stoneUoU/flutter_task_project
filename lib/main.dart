import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_task_project/base/config/hi_initialize.dart';
import 'package:flutter_task_project/base/config/hi_language.dart';
import 'package:flutter_task_project/base/config/hi_theme.dart';
import 'package:flutter_task_project/base/navigator/hi_navigator.dart';
import 'package:flutter_task_project/base/pages/hi_web_page.dart';
import 'package:flutter_task_project/logic/health_code/hi_health_code_page.dart';
import 'package:flutter_task_project/logic/login/hi_code_login_page.dart';
import 'package:flutter_task_project/logic/luanch/hi_bottom_navigator.dart';
import 'package:flutter_task_project/logic/luanch/hi_privacy_page.dart';
import 'package:flutter_task_project/logic/rainbow/hi_rainbow_report_page.dart';
import 'package:flutter_task_project/logic/route_code/hi_route_code_page.dart';
import 'package:flutter_task_project/net/db/hi_cache.dart';
import 'package:flutter_task_project/provider/hi_health_code_provider.dart';
import 'package:flutter_task_project/provider/hi_route_code_provider.dart';
import 'package:flutter_task_project/provider/hi_tabbar_provider.dart';
import 'package:menghabit/tool/widget/screen/screenutil_init.dart';
import 'package:provider/provider.dart';

void main() async {
  await HiInitialize.dispatchRunMainBefore().then((value) {
    Future.delayed(const Duration(milliseconds: 500), () {
      runApp(HiAPP());
    });
  });
}

class HiAPP extends StatefulWidget {
  @override
  _HiAPPState createState() => _HiAPPState();
}

class _HiAPPState extends State<HiAPP> {
  final APPRouteDelegate _routeDelegate = APPRouteDelegate();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HiCache>(
        //进行初始化
        future: HiCache.preInit(),
        builder: (BuildContext context, AsyncSnapshot<HiCache> snapshot) {
          //定义route
          var widget = snapshot.connectionState == ConnectionState.done
              ? Router(routerDelegate: _routeDelegate)
              : const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
          bool isAgree = HiCache.getInstance().get("isAgree") == null
              ? false
              : HiCache.getInstance().get("isAgree") as bool;
          _routeDelegate.routeStatus =
              isAgree ? RouteStatus.home : RouteStatus.privacy;
          // _routeDelegate.routeStatus = RouteStatus.routeCode;
          // _routeDelegate.routeStatus = RouteStatus.healthCode;
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => HiTabbarProvider()),
                ChangeNotifierProvider(create: (_) => HiHealthCodeProvider()),
                ChangeNotifierProvider(create: (_) => HiRouteCodeProvider())
              ],
              child: ScreenUtilInit(
                child: buildMaterialApp(widget),
              ));
        });
  }

  MaterialApp buildMaterialApp(Widget widget) {
    return MaterialApp(
        //标题栏的名字
        title: 'Hi Flutter',
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? HiTheme.kIOSTheme
            : HiTheme.kDefaultTheme, // 根据平台获取主题
        debugShowCheckedModeBanner: false, // 设置这一属性即可
        // onGenerateRoute: Application.router.generator,
        home: widget,
        builder: EasyLoading.init(),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        //国际化
        supportedLocales: [
          Locale(HiLanguage.currentLanguage, ''),
        ]);
  }
}

class APPRouteDelegate extends RouterDelegate<APPRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<APPRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Map? _args;
  late RouteStatus routeStatus;

  //为Navigator设置一个key，必要的时候可以通过navigatorKey.currentState来获取到NavigatorState对象
  APPRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    //实现路由跳转逻辑
    HiNavigator().registerRouteJump(
        RouteJumpListener(onJumpTo: (RouteStatus routeStatus, {Map? args}) {
      _args = args;
      this.routeStatus = routeStatus;
      notifyListeners();
    }));
    //设置网络错误拦截器
    // HiNet().setErrorInterceptor((error) {
    //   if (error is NeedLogin) {
    //     //拉起登录
    //     HiNavigator.getInstance().onJumpTo(RouteStatus.login);
    //   }
    // });
  }
  List<MaterialPage> pages = [];
  @override
  Widget build(BuildContext context) {
    var index = getPageIndex(pages, routeStatus);
    List<MaterialPage> tempPages = pages;
    if (index != -1) {
      //要打开的页面在栈中已存在，则将该页面和它上面的所有页面进行出栈
      //tips 具体规则可以根据需要进行调整，这里要求栈中只允许有一个同样的页面的实例
      tempPages = tempPages.sublist(0, index);
    }
    var page;
    if (routeStatus == RouteStatus.home) {
      pages.clear();
      page = pageWrap(HiBottomNavigator());
    } else if (routeStatus == RouteStatus.codeLogin) {
      page = pageWrap(HiCodeLoginPage(
          onCodeLoginPageListener: _args?["onCodeLoginPageListener"]));
    } else if (routeStatus == RouteStatus.privacy) {
      page = pageWrap(const HiPrivacyPage());
    } else if (routeStatus == RouteStatus.healthCode) {
      page = pageWrap(const HiHealthCodePage());
    } else if (routeStatus == RouteStatus.routeCode) {
      page = pageWrap(const HiRouteCodePage());
    } else if (routeStatus == RouteStatus.rainbowReport) {
      page = pageWrap(HiRainbowReportPage(reportId: _args?["reportId"]));
    } else if (routeStatus == RouteStatus.hiWeb) {
      page = pageWrap(HiWebPage(urlString: _args?["urlString"]));
    } else if (routeStatus == RouteStatus.rainbowReportDetail) {
      page = pageWrap(HiWebPage(urlString: _args?["reportId"]));
    }
    //重新创建一个数组，否则pages因引用没有改变路由不会生效
    tempPages = [...tempPages, page];
    //通知路由发生变化
    HiNavigator().notify(tempPages, pages);
    pages = tempPages;
    return WillPopScope(
      //fix Android物理返回键，无法返回上一页问题@https://github.com/flutter/flutter/issues/66349
      onWillPop: () async => !await navigatorKey.currentState!.maybePop(),
      child: Navigator(
        key: navigatorKey,
        pages: pages,
        onPopPage: (route, result) {
          //执行返回操作
          if (!route.didPop(result)) {
            return false;
          }
          var tempPages = [...pages];
          pages.removeLast();
          //通知路由发生变化
          HiNavigator().notify(pages, tempPages);
          return true;
        },
      ),
    );
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future<void> setNewRoutePath(APPRoutePath path) async {}
}

///定义路由数据，path
class APPRoutePath {
  final String location;
  APPRoutePath.home() : location = "/";
}
