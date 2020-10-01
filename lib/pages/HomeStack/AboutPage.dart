import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  void onPressed() {
    Navigator.pushNamed(context, '/contact');
  }

  Future<Map<String, dynamic>> getData() async {
    var url = 'https://api.codingthailand.com/api/version';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var version = convert.jsonDecode(response.body);
      return version;
    } else {
      throw Exception('failed to load');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('about build');
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
            FutureBuilder<Map<String, dynamic>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data['data']['version']);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
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
