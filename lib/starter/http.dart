// stf 文字快捷生成一个 StatefulWidget 模版代码
// import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy extends StatefulWidget {
  const HttpStudy({super.key});

  @override
  State<HttpStudy> createState() => _HttpStudyState();
}

class _HttpStudyState extends State<HttpStudy> {
  var resultShow = '';
  var resultShow2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基于Http实现网络操作')),
      body: Column(
        children: [
          _doGetBtn(),
          _doPostBtn(),
          _doPostJsonBtn(),
          Text('返回的结果：$resultShow'),
          Text('返回的json结果：$resultShow2'),
        ],
      ),
    );
  }

  ElevatedButton _doGetBtn() {
    return ElevatedButton(onPressed: _doGet, child: const Text('Get请求'));
  }

  ElevatedButton _doPostBtn() {
    return ElevatedButton(onPressed: _doPost, child: const Text('Post请求'));
  }

  ElevatedButton _doPostJsonBtn() {
    return ElevatedButton(
      onPressed: _doPostJson,
      child: const Text('PostJson请求'),
    );
  }

  void _doGet() async {
    var uri = Uri.parse(
      'https://api.geekailab.com/uapi/test/test?requestPrams=11',
    );
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      setState(() {
        resultShow = response.body;
      });
    } else {
      setState(() {
        resultShow = "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }

  void _doPost() async {
    var uri = Uri.parse('https://api.geekailab.com/uapi/test/test');
    var params = {"requestPrams": "doPost"}; //数据格式必须为Map<String, String>
    var response = await http.post(
      uri,
      body: params,
    ); //默认为x-www-form-urlencoded 格式，所以可以不用设置content-type

    if (response.statusCode == 200) {
      setState(() {
        resultShow = response.body;
      });
    } else {
      setState(() {
        resultShow = "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }

  void _doPostJson() async {
    var uri = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
    var params = {"requestPrams": "doPost"};
    var response = await http.post(
      uri,
      body: jsonEncode(params), // jsonEncode 将数据转换成string
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        resultShow = response.body;
        resultShow2 = jsonDecode(response.body)['msg'];
      });
    } else {
      setState(() {
        resultShow = "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }
}
