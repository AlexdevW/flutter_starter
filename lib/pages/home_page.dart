import 'package:flutter/material.dart';
import 'package:flutter_start/dao/home_dao.dart';
import 'package:flutter_start/dao/login_dao.dart';
import 'package:flutter_start/model/home_model.dart';
import 'package:flutter_start/util/view_util.dart';
import 'package:flutter_start/widget/banner_widget.dart';

class HomePage extends StatefulWidget {
  static Config? configModel;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  static const appBarScrollOffset = 100;
  double appBarAlpha = 0;
  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];
  bool _loading = true;

  // final List<String> bannerList = [
  //   "https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
  //   "https://o.devio.org/images/fa/cat-4098058__340.webp",
  //   "https://o.devio.org/images/fa/photo-1601513041797-a79a526a521e.webp",
  //   "https://o.devio.org/images/other/as-cover.png",
  //   "https://o.devio.org/images/other/rn-cover2.png",
  // ];

  ElevatedButton get _logoutBtn => ElevatedButton(
    onPressed: () {
      LoginDao.logOut();
    },
    child: const Text('登出'),
  );

  Widget get _appBar {
    // 获取刘海屏实际的Top安全边距
    double top = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        shadowWrap(
          child: Container(
            padding: EdgeInsets.only(top: top),
            height: 60 + top,
            width: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: const Text('test'),
          ),
        ),
      ],
    );
  }

  ListView get _listView => ListView(
    children: [
      BannerWidget(bannerList: bannerList),
      // _logoutBtn,
    ],
  );

  MediaQuery get _contentView => MediaQuery.removePadding(
    removeTop: true, //移除顶部空白
    context: context,
    child: RefreshIndicator(
      color: Colors.blue,
      onRefresh: _handleRefresh,
      child: NotificationListener(
        onNotification: (scrollNotification) {
          ///通过depth来过滤指定widget发出的滚动事件，depth == 0表示最外层的列表发出的滚动事件滚动且是列表滚动的事件
          if (scrollNotification is ScrollUpdateNotification &&
              scrollNotification.depth == 0) {
            _onScroll(scrollNotification.metrics.pixels);
          }
          return false;
        },
        child: _listView,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Stack(children: [_contentView, _appBar]),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onScroll(double offset) {
    print('offset:$offset');
    double alpha = offset / appBarScrollOffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    print('alpha:$alpha');
    setState(() {
      appBarAlpha = alpha;
    });
    print('appBarAlpha:$appBarAlpha');
  }

  Future<void> _handleRefresh() async {
    try {
      HomeModel? model = await HomeDao.fetch();
      if (model == null) {
        setState(() {
          _loading = false;
        });
        return;
      }
      setState(() {
        HomePage.configModel = model.config;
        localNavList = model.localNavList ?? [];
        subNavList = model.subNavList ?? [];
        bannerList = model.bannerList ?? [];
        localNavList = model.localNavList ?? [];
        _loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _loading = false;
      });
    }
  }
}
