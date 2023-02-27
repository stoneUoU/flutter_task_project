import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiRouteCodeSourceCell extends StatelessWidget {
  const HiRouteCodeSourceCell({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("信息说明",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.px,
                color: color_FF303133,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(24.px, 16.px, 0, 0),
                child: Text("数据来源：",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.px,
                      color: color_FF606266,
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8.px, 16.px, 24.px, 0),
                child: Text("国家政务服务平台和福建省相关部门",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.px,
                      color: color_FF606266,
                    )),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8.px, 24.px, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(24.px, 0, 8.px, 0),
                  child: Text("注意事项：",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                ),
                Expanded(
                  child: Text("使用健康码时不要离开本页面且需本人操作确认",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8.px, 24.px, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(24.px, 0, 8.px, 0),
                  child: Text("使用范围：",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                ),
                Expanded(
                  child: Text("依托国家政务服务平台，实现跨省（区、市）数据共享和互通互认",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8.px, 24.px, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(24.px, 0, 8.px, 0),
                  child: Text("客服电话：",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                ),
                Expanded(
                  child: Text("400-666-1331 （7*24小时）",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8.px, 24.px, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(24.px, 0, 8.px, 0),
                  child: Text("主办机构：",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                ),
                Expanded(
                  child: Text("福建省数字办 卫健委 医保局",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8.px, 24.px, 36.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(24.px, 0, 8.px, 0),
                  child: Text("承办机构：",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                ),
                Expanded(
                  child: Text("福建省大数据有限公司",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.px,
                        color: color_FF606266,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
