import 'package:flutter_start/basic/3.oop.dart';

void main() {
  Cache<String> cache1 = Cache<String>();

  cache1.setItem('cache1', 'hello');
  // cache1.setItem('cache1', 1);// 类约束 会有类型检查不能传1了
  String? string1 = cache1.getItem('cache1');
  print('string1:$string1');

  Cache<int> cache2 = Cache<int>();
  cache2.setItem('cache2', 2);
  int? int1 = cache2.getItem('cache2');
  print('int1:$int1');

  Member<Student> member = Member(Student('MIT', 'John', 30));
  print(member.fixedName());
}

// 泛型类
// 泛型类主要作用； 提高代码的复用度
class Cache<T> {
  final Map<String, T> _cached = {};

  void setItem(String key, T value) {
    _cached[key] = value;
  }

  T? getItem(String key) {
    return _cached[key];
  }
}

class Member<T extends Person> {
  // 泛型作用：约束参数类型, 这些约束 _person 必须是 Person 的子类
  final T _person;
  Member(this._person);

  String fixedName() {
    return 'fixed:${_person.name}';
  }
}
