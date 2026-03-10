import 'package:flutter/material.dart';
import 'package:flutter_start/model/home_model.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNav({super.key, required this.localNavList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(7, 4, 7, 4),
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(padding: const EdgeInsets.all(7), child: _items(context)),
    );
  }

  Row _items(BuildContext context) {
    List<Widget> items = [];
    for (var item in localNavList) {
      items.add(_item(context, item));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              model.icon!,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
          Text(model.title!, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
