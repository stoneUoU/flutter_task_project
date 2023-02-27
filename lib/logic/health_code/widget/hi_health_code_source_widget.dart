import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:flutter_task_project/base/config/hi_const.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class HiHealthCodeSourceWidget extends StatelessWidget {
  const HiHealthCodeSourceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenW(context),
      height: 188.px + 64.px + ScreenUtils.padBotH(),
      child: Column(
        children: [
          Container(
              width: ScreenW(context),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius:
                    new BorderRadius.all(new Radius.circular(10.0.px)),
              ),
              margin: EdgeInsets.fromLTRB(16.px, 0, 16.px, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16.px, 16.px, 0, 0),
                    child: Text(
                      "信息说明",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24.px,
                        fontWeight: FontWeight.w500,
                        color: color_FF303133,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16.px, 16.px, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          ".数据来源：   ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.px,
                            color: color_FF303133,
                          ),
                        ),
                        Text(
                          "国家政务服务平台和福建省相关部门。",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.px,
                            color: color_FF303133,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16.px, 8.px, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          ".注意事项：   ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.px,
                            color: color_FF303133,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "使用健康码时不要离开本页面且需本人操作确认。",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.px,
                            color: color_FF303133,
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16.px, 8.px, 16.px, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ".使用范围：   ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.px,
                            color: color_FF303133,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "依托国家政务服务平台，实现跨省（区、市）数据共享和互通互认。",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.px,
                            color: color_FF303133,
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
              height: 188.px),
          Expanded(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 12.px),
                child: Text(
                  "客服电话：12320 0591-62623959 8:00-12:00 14:00-18:00",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.px,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.px),
                child: Text(
                  "本应用由福建省数字办 卫健委 医保局主办 福建省经济信息中心承办",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.px,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  height: ScreenUtils.padBotH(), width: ScreenUtils.screenW())
            ],
          ))
        ],
      ),
    );
  }
}
