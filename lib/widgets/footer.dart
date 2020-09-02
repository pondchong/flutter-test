import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  Footer({Key key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String name = 'testttt';
  @override
  void initState() {
    super.initState();
    print('init');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Column(children: [
      Text('$name'),
      RaisedButton(onPressed: onPressed, child: Text('Click Me'))
    ]);
  }

  void onPressed() {
    setState(() {
      name = 'eiei';
    });
  }
}
