import 'package:flutter/material.dart';
// 常用数据类型
class DataType extends StatefulWidget { // st 选择stful
  @override
  _State createState() => _State();
}

class _State extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();
    return Container(child: Text('常用数据类型，请查看控制台输出'),);

  }

  // 数字类型
  void _numType() {
    // 既可以接受浮点类型 又可以接受整型
    num num1 = -1.0; // 是数字类型的父类
    num num2 = 2; // 是数字类型的父类
    int int1 = 3; // 只能是整数
    double d1 = 1.68; // 双精度
    print("num:$num1 num:$num2 int:$int1 double:$d1");
    print(num1.abs());// 求绝对值
    print(num1.toInt()); // 转换成int类型
    print(num1.toDouble());// 转换成double类型
  }

  _stringType() {
    String str1 = '字符串',str2 = "双引号";// 字符串的定义 单引号和双引号都可以
    String str3 = 'str:$str1 str2:$str2';// 字符串的拼接
    String str4 = 'str1:' + str1 + 'str2:' + str2; // 字符串的拼接
    String str5 = '常用数据类型，请看控制台输出';
    print(str3);
    print(str4);

    // 常用方法
    print(str5.substring(1,5)); // 截取字符串 位置和长度
    print(str5.indexOf('类型')); // 获取指定字符串位置
  }

  // 布尔类型 Dart是强迫类型检查 bool类型检查 只有bool类型值是true 才被认为是true


  _boolType() {
    bool success = true,fail = false;
    print(success);
    print(fail);
    print(success || fail);//true
    print(success && fail);// false
  }

  // List集合
  _listType() {
    print('-----_listType -----');
    // 集合初始化的方式
    List list = [1,2,3,'集合']; // 初始化时添加元素
    print(list);
    List<int>list2 = [1,2,3,4,5,6,7];
    print(list2);
//    list2 = list; 类型不同 会报错 类型转换错误
    List list3 = [];
    list3.add('list3');// 通过add方法添加元素
    list3.addAll(list);

    List list4 = List.generate(3,(index)=>index * 2); // 打印[0,2,4]
    print(list4);

    // 遍历集合的方式
    for(int i = 0;i < list.length; i ++) {
      print(list[i]);
    }

    for(var o in list) {
      print(o);
    }

    list.forEach((val) {
      print(val);
    });

    list.removeLast();
    list.removeAt(0);
  }

    // map是将key和value 相关联的对象，key和value都可以是任何类型的对象，并且key是唯一的
    _mapType() {
        print('-----------_mapType---------');
        // map 的初始化
        Map names = {'xiaoming':'小明','xiaohong':'小红'};
        print(names);
        Map ages = {};
        ages['xiaoming'] = 16;
        ages['xiaohong'] = 18;
        print(ages);

        // Map遍历
      ages.forEach((k,v){
        print('$k,$v');
      });

      Map ages2 = ages.map((k,v){
        return MapEntry(v,k);
      });
      print(ages2);

      for (var key in ages.keys) {
        print('$key,${ages[key]}');
      }
      // 作业
      // keys values remove containsKey
    }
  // 科普小知识 dynamic var Object三者的区别
  /*
  * dynamic：是所有Dart对象的基础类型，在大多数情况下，通常不直接使用它，
  * 通过它定义的变量会关闭类型检查，这意味着dynamic x = 'hal'; x.foo();
  * 这段代码静态类型检查不会报错，但是运行时会crash，因为x冰没有foo()方法，所以建议大家在。。
  * var:是一个关键字，意思是"我不关心这里的类型是什么"，系统会自动推断类型runtimeType；
  * Object：是Dart对象的基类，当你定义：Object o = xxx;时这时候系统会认为o是对象，
  * 因为Object提供了这些方法，但是如果尝试调用o.foo()时，静态类型检查进行报错
  * 综上不难看出dynamic与Object的最大区别是在静态类型检查上
  * */
      _tips() {
      print('---------tips------');
      // dynamic 动态数据类型 好处可以定义任意类型  好处不会进行数据类型检查
      dynamic x = 'hal';
      print(x.runtimeType);
      print(x);

      x = 123;
      print(x.runtimeType);
      print(x);

      // var 系统推断数据类型 数据类型一旦被定义  不允许修改 dynamic不同
      var a = 'hal';
      print(a.runtimeType);
      print(a);

      // Object 基类
        Object o1 = '111';
        print(o1.runtimeType);
        print(o1);
  }
  
}

