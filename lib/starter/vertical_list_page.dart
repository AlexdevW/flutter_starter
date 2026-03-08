import 'package:flutter/material.dart';
import 'package:flutter_start/util/screen_adapter_helper.dart';

const cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨',
];

///垂直滚动的列表
class VerticalListPage extends StatelessWidget {
  const VerticalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);
    const title = 'list';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ListView(children: _buildList()),
      ),
    );
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.amber),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 90.px),
      ),
    );
  }
}
