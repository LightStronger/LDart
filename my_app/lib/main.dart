import 'package:flutter/material.dart';
import 'package:my_app/data_type.dart';
import 'package:my_app/function_learn.dart';
import 'package:my_app/oop_learn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(



        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _oopLearn();
    _functionLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            DataType()
          ],

      ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _oopLearn() {
    print('-------_oopLearn-------');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2); // 返回true 类似单例

    // 静态方法调用
    Student.doPrint('_oopLearn');

    // 创建Student的对象
    Student stu1 = Student('清华','Jack',18);
    stu1.school = '985'; // set方法
    print(stu1.toString());

    // 重写toString方法
    Student stu2 = Student('北大', 'Tome', 16,city: '上海',country: '中国');
    print(stu2.toString());

    // 抽象类
    StudyFlutter studyFlutter = StudyFlutter();
    studyFlutter.study();
  }

  void _functionLearn() {
    TestFuntion textFunction = TestFuntion();
    textFunction.start();
  }
}
