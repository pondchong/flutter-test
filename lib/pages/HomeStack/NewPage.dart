import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/logo.dart';
import 'package:fluttertest/widgets/menu.dart';

class NewPage extends StatefulWidget {
  NewPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  var fromAbout; // dynamic
  void onPressed() async {
    fromAbout = await Navigator.pushNamed(context, 'homestack/about',
        arguments: {'email': 'test@gmail.com', 'phone': '0954153232'});
    setState(() {
      fromAbout = fromAbout;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Logo(),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover)),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/company');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business,
                        size: 80,
                      ),
                      Text(
                        'บริษัท',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  color: Colors.white70,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 80,
                    ),
                    Text(
                      'แผนที่',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.white70,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 80,
                    ),
                    Text(
                      'กล้อง',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.white70,
              ),
              GestureDetector(
                onTap: () async {
                  fromAbout = await Navigator.pushNamed(
                      context, 'homestack/about', arguments: {
                    'email': 'test@gmail.com',
                    'phone': '0954153232'
                  });
                  setState(() {
                    fromAbout = fromAbout;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 80,
                      ),
                      Text(
                        'เกี่ยวกับ ${fromAbout ?? ''}',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  color: Colors.white70,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/room', arguments: {
                    'email': 'test@gmail.com',
                    'phone': '0954153232'
                  });
                  setState(() {
                    fromAbout = fromAbout;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.room_service,
                        size: 80,
                      ),
                      Text(
                        'ห้องพัก',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ));
  }
}
