// 定义一个dart类，所有的类都继承自Object

// 继承自Person类
class Student extends Person {
  String _school; // 通过下划线来标识私有字段(变量)
  final String city;
  String country;
  String name;
  /*
  * 构造方法
  * 通this._school初始化自由参数
  * name,age交给父类进行初始化
  * {} 代表可选参数 city 为可选参数
  * country 是默认参数
  * */
  Student(this._school,String name, int age,{this.city,this.country = 'China'}) :
        // 初始化列表：除了调用父类构造器，在子类构造器方法体之前，你也可以初始化实例变量，不同的初始化变量之间用逗号分隔开
        name = '$country.$city',
  // 如果父类没有默认构造方法(无参的构造方法)，则需要在初始化列表汇中调用父类的构造方法进行初始化
//        super(name, age);

        super(name, age) {
        // 构造方法体不是必须的
        print('构造方法体不是必须的');
  }

  // 命名构造方法：[类名+.+方法名] 数据请求时常用
  // 命名构造方法
//  Student.cover(Student stu):super(stu.name,stu.age);
  Student.cover(Student stu,this.city):super(stu.name,stu.age) {
    // 构造方法体不是必须的
    print('命名构造方法');
  }

  // 命名工厂构造方法:factory [类名+.+方法名]
  // 它可以有返回值，而且不需要讲类的final变量作为参数，是提供一种灵活获取类对象的方式
  // 方法比命名构造方法更灵活
  factory Student.stu(Student stu) {
    return Student(stu._school,stu.name,stu.age);
  }

  // 重写方法toString
  @override
  String toString() {
    return 'name:$name school:${this._school},city:$city,country:$country ${super.toString()}';
  }


  // 可以为私有字段设置getter来让外界获取到私有字段
  String get school => _school;
  // 可以为私有字段设置setter来控制外界对私有字段的修改
  set school(String value) {
      _school = value;
  }

  // 静态方法
  static doPrint(String str) {
    print('doPrint:$str');
  }
}

// 工厂构造方法演示
class Logger {
  static Logger _cache;
  /* 可理解为单利
  * 工厂构造方法：
  * 不仅仅是构造方法，更是一种模式
  * 有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足需求
  * 那么可以使用工厂模式来定义构造方法
  * */
  factory Logger() {
    if(_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }
  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}




class Person {
    String name;
    int age;
    // 标准的构造方法
    Person(this.name,this.age); // 初始化方法

    // 重写父类的方法 多态
    @override
    String toString() {
      return 'name:$name,age:$age';
    }
}


/*
* 继承抽象类要实现它的抽象方法，否则也需要将自己定义成抽象类
* */
class StudyFlutter extends Study {
  @override
  void study() {
    print('Learning Flutter');
  }
}


/* 抽象类 使用abstract修饰符佬顶一个抽象类，该类不能被实例化，抽象类在定义接口的时候非常有用，实际上抽
    象中包含一些实现
* */
abstract class Study {
  void study();
}


/*为类添加特征：mixins
*  mixins 是在多个类层结构中重用代码的一种方式
* 要使用mixins 在with关键字后面跟上一个或多个mixin的名字（用逗号分隔），并且with要用在exends关键字之后
* mixins的特征：实现mixin，就创建一个继承Object类的子类（不能继承其他类），不能声明任何构造方法，不调用super
/
// 上面只有study是mixins
 */

class Test extends Person with Study{
  Test(String name,int age) : super(name,age);
  @override
  void study() {

  }
}
