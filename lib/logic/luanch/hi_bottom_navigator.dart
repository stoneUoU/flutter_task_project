import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/navigator/hi_navigator.dart';
import 'package:flutter_task_project/logic/home/hi_home_page.dart';
import 'package:flutter_task_project/logic/mine/hi_mine_page.dart';
import 'package:flutter_task_project/logic/rainbow/hi_rainbow_home_page.dart';

///底部导航
class HiBottomNavigator extends StatefulWidget {
  @override
  _HiBottomNavigatorState createState() => _HiBottomNavigatorState();
}

class _HiBottomNavigatorState extends State<HiBottomNavigator> {
  final _activeColor = Colors.red;
  static int initialPage = 0;
  final PageController _controller = PageController(initialPage: initialPage);
  late List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [HiHomePage(), HiRainbowHomePage(), HiMinePage()];
    //页面第一次打开时通知打开的是那个tab
    HiNavigator().onBottomTabChange(initialPage, _pages[initialPage]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _pages,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => _onJumpTo(context, index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _activeColor,
        unselectedItemColor: color_FF303133,
        items: [
          _bottomItem('首页', 'assets/images/tab_bar/mine_icon_store_onclick.png',
              'assets/images/tab_bar/mine_icon_store_click.png', 0),
          _bottomItem(
              '彩虹',
              'assets/images/tab_bar/icon_shoppingcar_onclick.png',
              'assets/images/tab_bar/icon_shoppingcar_click.png',
              0),
          _bottomItem('我的', 'assets/images/tab_bar/mine_icon_mine_onclick.png',
              'assets/images/tab_bar/mine_icon_mine_click.png', 2)
        ],
      ),
    );
  }

  _bottomItem(String title, String icon, String activeIcon, int index) {
    return BottomNavigationBarItem(
        icon: Image(
          image: AssetImage(icon),
          width: 20,
          height: 20,
        ),
        activeIcon: Image.asset(
          activeIcon,
          width: 20,
          height: 20,
        ),
        label: title);
  }

  void _onJumpTo(BuildContext context, int index) {
    // if (index == 1 || index == 2) {
    //   String personalInfo = HiCache.getInstance().get("personalInfo") ?? "";
    //   if (personalInfo.length == 0) {
    //     HiNavigator().onJumpTo(RouteStatus.codeLogin, args: {
    //       "onCodeLoginPageListener": (bool isSuccess) {
    //         if (isSuccess) {
    //           _controller.jumpToPage(index);
    //           setState(() {
    //             //控制选中第一个tab
    //             _currentIndex = index;
    //           });
    //         }
    //       }
    //     });
    //   } else {
    //     Map<String, dynamic> map = json.decode(personalInfo);
    //     HiLoginModel model = HiLoginModel.fromJson(map);
    //     _controller.jumpToPage(index);
    //     setState(() {
    //       //控制选中第一个tab
    //       _currentIndex = index;
    //     });
    //   }
    // } else {
    _controller.jumpToPage(index);
    setState(() {
      //控制选中第一个tab
      _currentIndex = index;
    });
    // }
  }
}
