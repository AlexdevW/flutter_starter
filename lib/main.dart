import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:flutter_start/dao/login_dao.dart';
import 'package:flutter_start/navigator/tab_navigator.dart';
import 'package:flutter_start/pages/login_page.dart';
import 'package:flutter_start/starter/expansion_tile_page.dart';
import 'package:flutter_start/starter/gridview_page.dart';
import 'package:flutter_start/starter/horizontal_list_page.dart';
import 'package:flutter_start/starter/refresh_loadmore_page.dart';
import 'package:flutter_start/starter/vertical_list_page.dart';
import 'package:flutter_start/util/screen_adapter_helper.dart';

void main() {
  runApp(const MyApp());
  // runApp(const VerticalListPage());
  // runApp(const HorizontalListPage());
  // runApp(const ExpansionTilePage());
  // runApp(const RefreshLoadMorePage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter之旅',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<dynamic>(
        future: HiCache.preInit(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          ScreenHelper.init(context); //初始化屏幕适配工具
          if (snapshot.connectionState == ConnectionState.done) {
            if (LoginDao.getBoardingPass() == null) {
              return const LoginPage();
            } else {
              return const TabNavigator();
            }
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
