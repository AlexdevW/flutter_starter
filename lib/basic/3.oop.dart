void main() {
  Person person = Person('John', 30);
  print(person);

  Student student = Student('MIT', 'John', 30);
  print(student);

  print(student.toString());

  Student stu2 = Student.cover(student);

  print(stu2);

  Student stu3 = Student.stu(student);

  print(stu3);

  Logger logger = Logger();
  logger.log(student);

  Logger logger2 = Logger();
  logger2.log(student);

  print('logger == logger2: ${logger == logger2}');

  StudyFlutter studyFlutter = StudyFlutter();
  studyFlutter.study();

  StudyFlutter2 studyFlutter2 = StudyFlutter2();
  studyFlutter2.study();
}

// 定义一个 Dart 类， 所以类都继承自 Object
class Person {
  String? name;
  int? age;

  Person(this.name, this.age);

  @override
  String toString() {
    return 'Person(name: $name, age: $age)';
  }
}

class Student extends Person {
  // final 该字段只能在运行时初始化一次，不能重复初始化， 与 const 不同的是 const 在编译时就必须初始化
  // final String? _school; // 通过下划线来标识私有字段 （变量） 作用域仅限于当前文件
  String? _school; // 通过下划线来标识私有字段 （变量） 作用域仅限于当前文件
  String? city;
  String? country;
  String? fullName;

  // 通过this._school 初始化自有参数
  // name age 交个父类进行初始化
  // city 可选参数
  // country 可选参数， 默认值为 'China'
  Student(
    this._school,
    String? name,
    int? age, {
    this.city,
    this.country = 'China',
  }) : fullName = '$country.$city',
       super(name, age) {
    // 构造方法不是必须的
  }

  // 命名构造方法： [雷鸣+.+方法名]
  // 使用命名构造方法为类实现多个构造方法
  Student.cover(Student stu) : _school = null, super(stu.name, stu.age) {
    print('命名构造方法');
  }

  // 命名工厂构造方法, factory [类名+.方法名]
  // 它可以有返回值，而且不需要初始化final变量作为参数， 是提供一张灵活获取类对象的方式
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age);
  }

  // 可以为私有字段设置getter来让外界获取到私有字段
  String? get school => _school;

  set school(String? school) {
    _school = school;
  }

  @override
  String toString() {
    return 'Student(name: $name, age: $age, school: $_school) ${super.toString()}';
  }
}

// 抽象类是可以被继承的
// 继承抽象类要实现它的抽象方法（没有方法体的方法）， 否则也需要将自己定义成抽象类
class StudyFlutter extends Study {
  @override
  void study() {
    print('study Flutter');
  }
}

// 抽象类也可以被实现， 必须要实现抽象类中的所有方法，有方法体的也需要实现
class StudyFlutter2 implements Study {
  @override
  void study() {
    print('study Flutter');
  }

  @override
  void study2() {
    print('study2');
  }
}

// abstract 定义抽象类， 不能实例化
// 抽象类不能创建实例对象，其作用用于定义接口
// 抽象类在定义接口的时候非常有用，实际抽象中也包含一些实验
abstract class Study {
  // 抽象方法， 没有方法体的方法称为抽象方法，不需要 abstract 关键字
  void study();

  // 抽象类中可以包含方法体
  void study2() {
    print('study2');
  }
}

// 工厂构造方法演示
class Logger {
  static Logger? _cache;

  factory Logger() {
    _cache ??= Logger._internal();
    return _cache!;
  }

  // 定义一个命名构造方法 （只是构造函数的另一种写法）
  Logger._internal();

  // void log(Student msg) {
  //   print(msg);
  // }

  void log(Student msg) => print(msg);
}

//为类添加特征：mixins
//mixins是在多个类层次结构中重用代码的一种方式
//要使用mixins,在with关键字后面跟一个或多个mixin的名字（用逗号分开），并且with要用在extends:关键字之后
//mixin 的特征：实现mixin,就创建一个继承Object类的子类（不能继承其他类），不声明任何构造方法，不调用super

// 必须要 mixin 定义
mixin class Study2 {
  // 抽象类中可以包含方法体
  void study2() {
    print('study2');
  }
}

class Test extends Person with Study2 {
  Test(super.name, super.age);

  void study() {
    study2();
  }
}
