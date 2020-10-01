import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    print('contact build');
    return Scaffold(
      appBar: AppBar(
        title: Text('ติดต่อ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ติดต่อ'),
            RaisedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, 'homestack/home', (route) => false),
              child: Text('กลับหน้าหลัก'),
            )
          ],
        ),
      ),
    );
  }
}
