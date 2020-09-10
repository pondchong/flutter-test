import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  void onPressed() {
    Navigator.pushNamed(context, '/contact');
  }

  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('เกี่ยวกับเรา'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('เกี่ยวกับ'),
            SizedBox(
              height: 30,
            ),
            Text('${arg['email']}'),
            Divider(
              height: 20,
            ),
            Text('${arg['phone']}'),
            RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, 'homestack/contact'),
              child: Text('contact'),
            ),
            RaisedButton(
              onPressed: () => Navigator.pop(context, 'pop About'),
              child: Text('home'),
            )
          ],
        ),
      ),
    );
  }
}
