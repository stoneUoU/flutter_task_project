import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class HiMineElecWidget extends StatelessWidget {
  const HiMineElecWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.px),
            child: Text(
              "医保电子凭证",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color_FF303133,
                fontSize: 16.px,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/mine/ylz_mine_bank_card.png',
                        fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.only(top: 8.px),
                      child: Text("银行卡",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: color_FF303133,
                            fontSize: 16.px,
                          )),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/mine/ylz_mine_use_record.png',
                        fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.only(top: 8.px),
                      child: Text("使用记录",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: color_FF303133,
                            fontSize: 16.px,
                          )),
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/mine/ylz_mine_deal_record.png',
                        fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.only(top: 8.px),
                      child: Text("交易记录",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: color_FF303133,
                            fontSize: 16.px,
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
