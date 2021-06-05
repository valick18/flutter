import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
         home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color? color = Colors.white;

  List<int> createListRGB(){
    Random random = Random();
    List<int> listRGB = [];
    for(int i = 0; i < 3; i++)
      listRGB.add(random.nextInt(256));
    return listRGB;
  }

  void changeColorOfBackground() {
    var listRGB = createListRGB();
      setState((){
       color = Color.fromRGBO(listRGB[0], listRGB[1], listRGB[2], 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: changeColorOfBackground,
      child: Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: Text('Test task'),
        ),
        body: Center(
          child: Text('Hey there',
            style: Theme.of(context).textTheme.headline4),
        ),
      ),
    );
  }
}
