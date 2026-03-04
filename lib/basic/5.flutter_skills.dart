// dark 一个方法中最多不用超过100行代码

import 'package:flutter_start/basic/3.oop.dart';

void main() {}

void flutterSkills(Person? person) {
  List? list;
  bool? isOpen;

  // 安全调用
  // 对于不确定是否为空的对象，可以通过 ?. 的方式访问它的属性和方法已防止空异常 如：a?.foo()

  print(list?.length);
  print(person?.name);
  print(person!.name); // 非空断言， 尽量不要使用，除非非常确定 person不会为空

  // 善用 ?? 设置默认值
  if (isOpen ?? false) {
    print('open');
  }

  list = [];
  list.add(1);
  list.add('hello');
  list.add(true);

  if (list[0] == null || list[0] == '' || list[0] == 0) {
    print('list[0] is null, empty, or 0');
  }

  // 善用 contains, 避免写复杂的判断
  if ([null, '', 0].contains(list[0])) {
    print('list[0] is null, empty, or 0');
  }
}
