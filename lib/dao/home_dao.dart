import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_start/model/home_model.dart';

///首页大接口
class HomeDao {
  static Future<HomeModel?> fetch() async {
    await Future.delayed(const Duration(milliseconds: 500)); // 模拟网络延迟

    const mockJson = '''
{
  "data": {
    "config": {
      "searchUrl": "https://m.ctrip.com/webapp/flight/search"
    },
    "bannerList": [
      {
        "icon": "https://picsum.photos/id/1015/800/400",
        "title": "三亚旅游特惠",
        "url": "https://m.ctrip.com/webapp/hotel/",
        "statusBarColor": "ffffff",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1016/800/400",
        "title": "北京故宫游",
        "url": "https://m.ctrip.com/webapp/flight/",
        "statusBarColor": "ffffff",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1018/800/400",
        "title": "上海迪士尼",
        "url": "https://m.ctrip.com/webapp/train/",
        "statusBarColor": "ffffff",
        "hideAppBar": false
      }
    ],
    "localNavList": [
      {
        "icon": "https://picsum.photos/id/1020/80/80",
        "title": "酒店",
        "url": "https://m.ctrip.com/webapp/hotel/",
        "statusBarColor": "ffE8735B",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1021/80/80",
        "title": "机票",
        "url": "https://m.ctrip.com/webapp/flight/",
        "statusBarColor": "ff4BADF3",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1022/80/80",
        "title": "火车票",
        "url": "https://m.ctrip.com/webapp/train/",
        "statusBarColor": "ff4BADF3",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1023/80/80",
        "title": "旅游",
        "url": "https://m.ctrip.com/webapp/tour/",
        "statusBarColor": "ffFDA620",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1024/80/80",
        "title": "攻略",
        "url": "https://m.ctrip.com/webapp/guide/",
        "statusBarColor": "ff50C8C9",
        "hideAppBar": true
      }
    ],
    "gridNav": {
      "hotel": {
        "startColor": "ffFFA680",
        "endColor": "ffFF6E56",
        "mainItem": {
          "icon": "https://picsum.photos/id/1033/120/120",
          "title": "酒店",
          "url": "https://m.ctrip.com/webapp/hotel/",
          "statusBarColor": "ffE8735B",
          "hideAppBar": false
        },
        "item1": {
          "icon": "https://picsum.photos/id/1035/80/80",
          "title": "国内酒店",
          "url": "https://m.ctrip.com/webapp/hotel/list",
          "statusBarColor": "ffE8735B",
          "hideAppBar": false
        },
        "item2": {
          "icon": "https://picsum.photos/id/1036/80/80",
          "title": "海外酒店",
          "url": "https://m.ctrip.com/webapp/hotel/intl",
          "statusBarColor": "ffE8735B",
          "hideAppBar": false
        },
        "item3": {
          "icon": "https://picsum.photos/id/1037/80/80",
          "title": "民宿客栈",
          "url": "https://m.ctrip.com/webapp/hotel/home",
          "statusBarColor": "ffE8735B",
          "hideAppBar": false
        },
        "item4": {
          "icon": "https://picsum.photos/id/1038/80/80",
          "title": "特价酒店",
          "url": "https://m.ctrip.com/webapp/hotel/sale",
          "statusBarColor": "ffE8735B",
          "hideAppBar": false
        }
      },
      "flight": {
        "startColor": "ff75CEFF",
        "endColor": "ff4BADF3",
        "mainItem": {
          "icon": "https://picsum.photos/id/1040/120/120",
          "title": "机票",
          "url": "https://m.ctrip.com/webapp/flight/",
          "statusBarColor": "ff4BADF3",
          "hideAppBar": false
        },
        "item1": {
          "icon": "https://picsum.photos/id/1041/80/80",
          "title": "国内机票",
          "url": "https://m.ctrip.com/webapp/flight/domestic",
          "statusBarColor": "ff4BADF3",
          "hideAppBar": false
        },
        "item2": {
          "icon": "https://picsum.photos/id/1042/80/80",
          "title": "国际机票",
          "url": "https://m.ctrip.com/webapp/flight/intl",
          "statusBarColor": "ff4BADF3",
          "hideAppBar": false
        },
        "item3": {
          "icon": "https://picsum.photos/id/1043/80/80",
          "title": "特价机票",
          "url": "https://m.ctrip.com/webapp/flight/sale",
          "statusBarColor": "ff4BADF3",
          "hideAppBar": false
        },
        "item4": {
          "icon": "https://picsum.photos/id/1044/80/80",
          "title": "退改签",
          "url": "https://m.ctrip.com/webapp/flight/refund",
          "statusBarColor": "ff4BADF3",
          "hideAppBar": false
        }
      },
      "travel": {
        "startColor": "ffFFD780",
        "endColor": "ffFDA620",
        "mainItem": {
          "icon": "https://picsum.photos/id/1050/120/120",
          "title": "旅游",
          "url": "https://m.ctrip.com/webapp/tour/",
          "statusBarColor": "ffFDA620",
          "hideAppBar": false
        },
        "item1": {
          "icon": "https://picsum.photos/id/1051/80/80",
          "title": "跟团游",
          "url": "https://m.ctrip.com/webapp/tour/group",
          "statusBarColor": "ffFDA620",
          "hideAppBar": false
        },
        "item2": {
          "icon": "https://picsum.photos/id/1052/80/80",
          "title": "自由行",
          "url": "https://m.ctrip.com/webapp/tour/free",
          "statusBarColor": "ffFDA620",
          "hideAppBar": false
        },
        "item3": {
          "icon": "https://picsum.photos/id/1053/80/80",
          "title": "周末游",
          "url": "https://m.ctrip.com/webapp/tour/weekend",
          "statusBarColor": "ffFDA620",
          "hideAppBar": false
        },
        "item4": {
          "icon": "https://picsum.photos/id/1054/80/80",
          "title": "邮轮",
          "url": "https://m.ctrip.com/webapp/tour/cruise",
          "statusBarColor": "ffFDA620",
          "hideAppBar": false
        }
      }
    },
    "subNavList": [
      {
        "icon": "https://picsum.photos/id/1060/80/80",
        "title": "景点门票",
        "url": "https://m.ctrip.com/webapp/ticket/",
        "statusBarColor": "ff50C8C9",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1061/80/80",
        "title": "汽车票",
        "url": "https://m.ctrip.com/webapp/bus/",
        "statusBarColor": "ff50C8C9",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1062/80/80",
        "title": "用车",
        "url": "https://m.ctrip.com/webapp/car/",
        "statusBarColor": "ff50C8C9",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1063/80/80",
        "title": "当地玩乐",
        "url": "https://m.ctrip.com/webapp/local/",
        "statusBarColor": "ff50C8C9",
        "hideAppBar": false
      },
      {
        "icon": "https://picsum.photos/id/1064/80/80",
        "title": "礼品卡",
        "url": "https://m.ctrip.com/webapp/giftcard/",
        "statusBarColor": "ff50C8C9",
        "hideAppBar": false
      }
    ],
    "salesBox": {
      "icon": "https://picsum.photos/id/1070/60/60",
      "moreUrl": "https://m.ctrip.com/webapp/sale/",
      "bigCard1": {
        "icon": "https://picsum.photos/id/1071/400/240",
        "title": "酒店特卖",
        "url": "https://m.ctrip.com/webapp/hotel/sale",
        "statusBarColor": "ffE8735B",
        "hideAppBar": false
      },
      "bigCard2": {
        "icon": "https://picsum.photos/id/1072/400/240",
        "title": "机票特惠",
        "url": "https://m.ctrip.com/webapp/flight/sale",
        "statusBarColor": "ff4BADF3",
        "hideAppBar": false
      },
      "smallCard1": {
        "icon": "https://picsum.photos/id/1073/200/150",
        "title": "周末游",
        "url": "https://m.ctrip.com/webapp/tour/weekend",
        "statusBarColor": "ffFDA620",
        "hideAppBar": false
      },
      "smallCard2": {
        "icon": "https://picsum.photos/id/1074/200/150",
        "title": "景点特惠",
        "url": "https://m.ctrip.com/webapp/ticket/sale",
        "statusBarColor": "ff50C8C9",
        "hideAppBar": false
      },
      "smallCard3": {
        "icon": "https://picsum.photos/id/1075/200/150",
        "title": "旅游大促",
        "url": "https://m.ctrip.com/webapp/tour/promo",
        "statusBarColor": "ffFDA620",
        "hideAppBar": false
      },
      "smallCard4": {
        "icon": "https://picsum.photos/id/1076/200/150",
        "title": "邮轮特卖",
        "url": "https://m.ctrip.com/webapp/tour/cruise",
        "statusBarColor": "ffFDA620",
        "hideAppBar": false
      }
    }
  }
}
''';

    debugPrint('[HomeDao] Using mock data');
    final result = json.decode(mockJson);
    return HomeModel.fromJson(result['data']);
  }
}
