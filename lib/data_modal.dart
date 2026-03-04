// Dart Model格式要求
// 1. 字段不能为私有（既字段前不能有下划线）；
// 2. 普通构造函数；
// 3. 声明为XXX.fromJson的命名构造函数；
// 4. 声明为Map<String, dynamic> toJson成员函数；其中：命名构造函数为必选。

class DataModel {
  int? code;
  String? method;
  String? requestPrams;

  DataModel({this.code, this.method, this.requestPrams});

  DataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    method = json['method'];
    requestPrams = json['requestPrams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['method'] = method;
    data['requestPrams'] = requestPrams;
    return data;
  }
}
