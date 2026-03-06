// 常用数据类型
import 'package:flutter_start/starter/basic/3.oop.dart';

void main() {
  // _numType();
  // _strType();
  // _boolType();
  // _listType();
  // _mapType();
  _tips();

  Student student = Student('MIT', 'John', 30);
  // student._school = 'MIT'; // 这个文件里面无法访问student的私有字段
  print(student.school);
  student.school = 'MIT';
  print(student);
}

// 数字类型
void _numType() {
  num num1 = -1.0; // num 是数字类型父类型， 有两个字类 int 和 double
  num num2 = 2; // num 可以存储 int 和 double

  int int1 = 1; // 只能是整数

  double d1 =
      1; // 双精度（是一种用 64 位（8 字节） 来存储小数的方式）的浮点数，即使值是整数， 也会被识别为 double // 1.0
  double d2 = 0.0000002;

  print("num1: $num1");
  print("num2: $num2");
  print("int1: $int1");
  print("d1: $d1");
  print("d2: $d2");

  print(num1.abs()); // 绝对值 1.0
  print(num1.toInt()); // 转换为 int // -1
  print(num2.toDouble()); // 转换为 double // 2.0
}

// 字符串类型
void _strType() {
  String str1 = "Hello";
  String str2 = 'World';

  print("str1: $str1");
  print("str2: $str2");

  print("str1:\\$str1");
  print(str1.length); // 长度 5
  print(str1 + str2); // 连接 HelloWorld
  print(str1.contains("Hello")); // 包含 true

  print(str1.substring(2)); // 从第 索引 2 开始截取
  print(str1[0]);
  print(str1.indexOf('lo')); // 返回匹配元素的索引

  print(str1.split('')); // 分割字符串

  print(str1.startsWith('He')); // 是否以 He 开头

  print(str1.endsWith('lo')); // 是否以 lo 结尾

  print(str1.isEmpty); // 是否为空

  print(str1.isNotEmpty); // 是否不为空

  print(str1.replaceAll('o', 'O')); // 替换字符串
}

// 布尔类型 Dart 是强类型检查，只有 bool类型值是true, 才被认为是true
void _boolType() {
  bool bool1 = true;
  bool bool2 = false;
  num str1 = 1.12;
  print("bool1: $bool1");
  print("bool2: $bool2");
  print(str1.runtimeType == int); // false
  print(str1.runtimeType == double); // true
  print(bool2.runtimeType == bool); // true

  print('bool1 || bool2: ${bool1 || bool2}'); // true
  print('bool1 && bool2: ${bool1 && bool2}'); // false
  print('!bool1: ${!bool1}'); // false
}

// list集合
void _listType() {
  List list1 = [1, 2, 3, 4, 5];
  List list2 = ["Hello", "World"];
  List list3 = [1, "Hello", true];
  print("list1: $list1");
  print("list2: $list2");
  print("list3: $list3");

  list1 = list2; // 动态类型（没有指定 List 的范型）可以相互转换
  print("list1: $list1");

  List<int> list4 = [1, 2, 3, 4, 5];
  List<String> list5 = ["Hello", "World"];
  List<dynamic> list6 = [1, "Hello", true];
  print("list4: $list4");
  print("list5: $list5");
  print("list6: $list6");

  list6 = list4; // dynamic 可以接受任何类型的 List
  print("list6: $list6");

  // list5 = list4; // 编译错误，List<String> 不能接受 int 类型
  print("list5: $list5");

  list4.add(2);
  print("list4: $list4");

  list5.add("Hello");
  print("list5: $list5");

  // list6.add(2);
  // list6.add("Hello"); // 报错
  // list6.add(true);
  // print("list6: $list6");

  list5.addAll(List<String>.from(list2));
  print("list5: $list5");

  List<num> list7 = List.generate(4, (index) => index * 2);
  print("list7: $list7");

  for (int i = 0; i < list7.length; i++) {
    print(list7[i]);
  }

  for (var element in list7) {
    print(element);
  }

  // list7.forEach((element) {
  //   print(element);
  // });

  print(list7.join(","));

  print(list7.remove(2));
  print(list7);

  print(list7.sublist(0, 2));

  print(list7.map((value) => value * 2));
}

// key 和 value 可以是任意类型， 并且key是唯一的，重复添加的会覆盖前面添加的key
void _mapType() {
  Map map1 = {"name": "John", "age": 30, "city": "New York"};
  print("map1: $map1");

  Map ages = {};
  ages['xiaoming'] = 15;
  ages['xiaohong'] = 18;
  print("ages: $ages");

  ages['xiaoming'] = 16;
  print("ages: $ages");

  Map age2 = ages.map((key, value) => MapEntry(key, value * 2));
  print("age2: $age2");

  for (var key in ages.keys) {
    print('key:$key value ${ages[key]}');
  }

  Map<String, int> ages2 = {};
  ages2['xiaoming'] = 15;
  ages2['xiaohong'] = 18;
  print("ages2: $ages2");

  print(ages2.keys);
  print(ages2.values);

  print(ages2.remove('xiaohong'));
  ages2.removeWhere((key, value) => value.toString().startsWith('1'));
  print(ages2);

  print(ages2.containsKey('xiaoming'));
  print(ages2.containsValue(15));
}
//
//  科普小知识：dynamic、var、Object的使用与区别
//    1、dynamic:是所有Dart对象的基础类型，在大多数情况下，通常不直接使用它
//      通过它定义的变量会关闭类型检查，这意味着dynamic x='haL';x.foo();
//      这段代码静态类型检查不会报错，但是运行时会crash,因为x并没有foo()方法，所以建议大家在编程时不要直接使用dynamic;
//    2、var:是一个关键字，意思是“我不关心这里的类型是什么。"，系统会自动推断类型runtimeType;
//    3、Object:是Dart对象的基类，当你定义：Object o=xxx;时这时候系统会认为o是个对象；
//      你可以调用o的toString()和hashCode()方法因为object提供了这些方法，
//      但是如果你尝试调用0.f00()时，静态类型检查会进行报错
//      综上不难看出dynamic与object最大的区别是在静态类型检查上；

void _tips() {
  dynamic dynamic1 = 1; // 会关闭对这个变量的类型检查
  dynamic1 = "Hello";
  dynamic1 = 1; // 可以改变dynamic的类型，但是value类型无法改变
  print("dynamic1: $dynamic1");
  dynamic1.split(','); // 运行的时候报错 数字类型没有 split 方法， 静态类型检查不会报错

  var var1 = 1;
  // var1 = "Hello"; // 报错 静态类型检查会报错
  // var1 = true; // 报错 静态类型检查会报错
  print("var1: $var1");

  Object object1 = 1;
  object1 = "Hello";
  // object1.split(','); // 只能使用Object提供的api
  object1 = true;
  print("object1: $object1");
}
