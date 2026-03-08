import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_start/util/screen_adapter_helper.dart';

///封装的艺术之轮播图组件的实现
class BannerWidget extends StatefulWidget {
  final List<String> bannerList;

  const BannerWidget({super.key, required this.bannerList});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CarouselSlider(
          items: widget.bannerList
              .map((item) => _tabImage(item, width))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 160.px,
            autoPlay: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Positioned(bottom: 10.px, left: 0, right: 0, child: _indicator()),
      ],
    );
  }

  Widget _tabImage(String item, double width) {
    return GestureDetector(
      onTap: () {
        // NavigatorUtil.jumpH5(
        //     url: model.url, title: model.title, hideAppBar: model.hideAppBar);
      },
      child: Image.network(item, width: width, fit: BoxFit.cover),
    );
  }

  Row _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.bannerList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 6.px,
            height: 6.px,
            margin: EdgeInsets.symmetric(vertical: 8.px, horizontal: 4.px),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Colors.white).withValues(
                alpha: _current == entry.key ? 0.9 : 0.4,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
