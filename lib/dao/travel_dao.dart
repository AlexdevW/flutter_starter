import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../model/travel_category_model.dart';
import '../model/travel_tab_model.dart';

///旅拍模块Dao
class TravelDao {
  ///获取旅拍类别接口
  static Future<TravelCategoryModel?> getCategory() async {
    // 模拟网络请求延迟
    await Future.delayed(const Duration(milliseconds: 500));

    const mockCategoryJson = '''
{
  "code": 200,
  "data": {
    "tabs": [
      {
        "labelName": "推荐",
        "groupChannelCode": "recommend"
      },
      {
        "labelName": "旅拍",
        "groupChannelCode": "travel"
      },
      {
        "labelName": "摄影",
        "groupChannelCode": "photo"
      },
      {
        "labelName": "打卡",
        "groupChannelCode": "checkin"
      }
    ]
  }
}
''';

    debugPrint('[TravelDao] getCategory using mock data');
    var result = json.decode(mockCategoryJson);
    return TravelCategoryModel.fromJson(result['data']);
  }

  ///获取旅拍类别下的数据
  static Future<TravelTabModel?> getTravels(
    String groupChannelCode,
    int pageIndex,
    int pageSize,
  ) async {
    // 模拟网络请求延迟
    await Future.delayed(const Duration(milliseconds: 500));

    // 根据 pageIndex 和 pageSize 可以决定返回的数据
    // 这里简单地返回相同的 mock 数据列表
    const mockTravelsJson = '''
{
  "code": 200,
  "data": {
    "total": 100,
    "list": [
      {
        "type": 1,
        "article": {
          "articleId": 1,
          "articleTitle": "探索未知的风景，记录美好的瞬间",
          "author": {
            "authorId": 1001,
            "nickName": "风光摄影师",
            "clientAuth": "知名旅游博主",
            "coverImage": {
              "dynamicUrl": "https://picsum.photos/id/1011/200/200",
              "originalUrl": "https://picsum.photos/id/1011/200/200"
            }
          },
          "images": [
            {
              "imageId": 101,
              "dynamicUrl": "https://picsum.photos/id/1018/800/600",
              "originalUrl": "https://picsum.photos/id/1018/800/600",
              "width": 800.0,
              "height": 600.0
            }
          ],
          "hasVideo": false,
          "video": null,
          "likeCount": 256,
          "commentCount": 45,
          "poiName": "冰岛·雷克雅未克"
        }
      },
      {
        "type": 1,
        "article": {
          "articleId": 2,
          "articleTitle": "城市漫步，寻找隐藏的咖啡馆",
          "author": {
            "authorId": 1002,
            "nickName": "城市探索者",
            "clientAuth": "探店达人",
            "coverImage": {
              "dynamicUrl": "https://picsum.photos/id/1025/200/200",
              "originalUrl": "https://picsum.photos/id/1025/200/200"
            }
          },
          "images": [
            {
              "imageId": 102,
              "dynamicUrl": "https://picsum.photos/id/1060/800/1000",
              "originalUrl": "https://picsum.photos/id/1060/800/1000",
              "width": 1000.0,
              "height": 1300.0
            }
          ],
          "hasVideo": false,
          "video": null,
          "likeCount": 128,
          "commentCount": 32,
          "poiName": "上海·新天地"
        }
      },
      {
        "type": 2,
        "article": {
          "articleId": 3,
          "articleTitle": "高山流水，大自然的鬼斧神工",
          "author": {
            "authorId": 1003,
            "nickName": "徒步爱好者",
            "clientAuth": "户外玩家",
            "coverImage": {
              "dynamicUrl": "https://picsum.photos/id/1043/200/200",
              "originalUrl": "https://picsum.photos/id/1043/200/200"
            }
          },
          "images": [
            {
              "imageId": 103,
              "dynamicUrl": "https://picsum.photos/id/1050/800/600",
              "originalUrl": "https://picsum.photos/id/1050/800/600",
              "width": 800.0,
              "height": 600.0
            }
          ],
          "hasVideo": false,
          "video": null,
          "likeCount": 512,
          "commentCount": 88,
          "poiName": "瑞士·阿尔卑斯"
        }
      },
      {
        "type": 1,
        "article": {
          "articleId": 4,
          "articleTitle": "海浪与沙滩的完美结合",
          "author": {
            "authorId": 1004,
            "nickName": "冲浪女孩",
            "clientAuth": "水上运动达人",
            "coverImage": {
              "dynamicUrl": "https://picsum.photos/id/1062/200/200",
              "originalUrl": "https://picsum.photos/id/1062/200/200"
            }
          },
          "images": [
            {
              "imageId": 104,
              "dynamicUrl": "https://picsum.photos/id/1070/800/800",
              "originalUrl": "https://picsum.photos/id/1070/800/800",
              "width": 800.0,
              "height": 1000.0
            }
          ],
          "hasVideo": false,
          "video": null,
          "likeCount": 333,
          "commentCount": 55,
          "poiName": "夏威夷·檀香山"
        }
      }
    ]
  }
}
''';

    debugPrint('[TravelDao] getTravels using mock data');
    var result = json.decode(mockTravelsJson);
    return TravelTabModel.fromJson(result['data']);
  }
}
