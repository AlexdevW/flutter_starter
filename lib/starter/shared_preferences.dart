// 页面缓存，从网络上获取数据的本地持久化等
// Flutter官方推荐我们用sharedpreferences进行数据存储，类似于RN中的AsyncStorage。

// shared_preferences是Flutter社区开发的一个本地数据存取插件：
// 简单的，异步的，持久化的key-value存储系统；
// 在Android上它是基于SharedPreferences的；
// 在iOS上它是基于NSUserDefaults的；

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStudy extends StatefulWidget {
  const SharedPreferencesStudy({super.key});

  @override
  State<SharedPreferencesStudy> createState() => _SharedPreferencesStudyState();
}

class _SharedPreferencesStudyState extends State<SharedPreferencesStudy> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // useMaterial3: false,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('基于shared_preferences实现计数器')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment Counter'),
            ),
            ElevatedButton(
              onPressed: _getCounter,
              child: const Text('Get Counter'),
            ),
            Text(countString, style: const TextStyle(fontSize: 20)),
            Text('result：$localCount', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Future<void> _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = "$countString 1";
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  Future<void> _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}

// open Runner.xcworkspace 打开
