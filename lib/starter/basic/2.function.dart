void main() {
  // sum(1, 2, isPrint: true);

  FunctionLearn functionLearn = FunctionLearn();
  functionLearn.sum(1, 2, isPrint: true);
  functionLearn
      ._learn(); // Dart 的私有是 library 级别，不是类级别。只要在同一个 .dart 文件里，就算是 _ 开头的方法也能访问。

  FunctionLearn.doSum(1, 2);
}

int sum(int val1, int val2, {bool? isPrint = false}) {
  var result = val1 + val2;
  if (isPrint == true) {
    print(result);
  }

  return result;
}

class FunctionLearn {
  // 实例方法
  int sum(int val1, int val2, {bool? isPrint = false}) {
    var result = val1 + val2;
    if (isPrint == true) {
      print(result);
    }

    // _learn();

    return result;
  }

  // 私有方法 _learn() 是 function_learn.dart 这个 library 私有
  void _learn() {
    print('私有方法');
  }

  //   匿名方法：
  // 大部分方法都带有名字，例如main()或者print():
  // 在Dart中你有可以创建没有名字的方法，称之为匿名方法，有时候也被称为Lambda或者closure闭包：
  // 你可以把匿名方法赋值给一个变量，然后你可以使用这个方法，比如添加到集合或者从集合中删除；
  // 匿名方法和命名方法看起来类似一在括号之间可以定义一些参数，参数使用逗号分割，也可以是可选参数；
  // 后面大括号中的代码为函数体：
  // ([[Type]param1[,]])
  // codeBlock;

  // 匿名方法
  void anonymousFunction() {
    int function(int val1, int val2) {
      return val1 + val2;
    }

    print(function(1, 2));
  }

  static int doSum(int val1, int val2) {
    return val1 + val2;
  }
}
