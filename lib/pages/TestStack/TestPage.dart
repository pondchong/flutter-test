import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/menu.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('test'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('My Birthday'),
                  Text('ttttttttttttttttttt'),
                  Row(),
                  Row(),
                  Row()
                ],
              )
            ],
          ),
        ));
  }
}
