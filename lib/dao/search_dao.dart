import '../model/search_model.dart';

///搜索接口
class SearchDao {
  static Future<SearchModel?> fetch(String text) async {
    // 模拟网络请求延迟
    await Future.delayed(const Duration(milliseconds: 500));

    // 根据 SearchItem 和 SearchModel 结构构建 Mock 数据
    Map<String, dynamic> mockJson = {
      "code": 200,
      "data": [
        {
          "code": "hotel_1",
          "word": "$text 相关酒店",
          "type": "hotel",
          "price": "499",
          "zonename": "核心商圈",
          "star": "豪华型",
          "districtname": "市中心",
          "url": "https://www.example.com",
        },
        {
          "code": "ticket_1",
          "word": "$text 相关门票",
          "type": "ticket",
          "price": "199",
          "zonename": "风景区",
          "star": "5A景区",
          "districtname": "郊区",
          "url": "https://www.example.com",
        },
        {
          "code": "travel_1",
          "word": "$text 相关跟团游",
          "type": "travel",
          "price": "2999",
          "zonename": "度假胜地",
          "star": "精品小团",
          "districtname": "海滨城市",
          "url": "https://www.example.com",
        },
      ],
    };

    // 解析为模型并返回·
    SearchModel model = SearchModel.fromJson(mockJson);
    model.keyword = text;
    return model;
  }
}
