import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_start/starter/data_modal.dart';

class JsonParsing extends StatefulWidget {
  const JsonParsing({super.key});

  @override
  State<JsonParsing> createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {
  String resultShow = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("JSON Parsing")),
      body: Column(
        children: [_json2MapBtn(), _json2ModelBtn(), Text(resultShow)],
      ),
    );
  }

  ElevatedButton _json2MapBtn() {
    return ElevatedButton(
      onPressed: _json2Map,
      child: const Text("JSON to Map"),
    );
  }

  ElevatedButton _json2ModelBtn() {
    return ElevatedButton(
      onPressed: _json2Model,
      child: const Text("JSON to Model"),
    );
  }

  void _json2Map() {
    String jsonString = '{"name": "John", "age": 30, "city": "New York"}';
    Map<String, dynamic> map = jsonDecode(jsonString);
    print('$map, ${map['name']}');
  }

  void _json2Model() {
    var jsonString =
        '{"code":0,"data":{"code":0,"method":"GET","requestPrams":"11"},"msg":"SUCCESS."}';
    Map<String, dynamic> map = jsonDecode(jsonString); //将json转成Map；
    DataModel model = DataModel.fromJson(map['data']); //将Map转成Dart Model
    // 转成 dart model 之后,就可以通过. 去访问属性了

    print(
      'code: ${model.code}, method: ${model.method}, requestPrams: ${model.requestPrams}',
    );
  }
}
