import 'package:flutter/material.dart';
import 'package:fluttertest/pages/HomeStack/HomeStack.dart';
import 'package:fluttertest/pages/NewsStack/NewsStack.dart';
import 'package:fluttertest/pages/ProductStack/ProductStack.dart';
import 'package:fluttertest/pages/TestStack/TestStack.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.grey,
        primaryColor: Color(0xFF423423),
        accentColor: Colors.deepPurple,

        textTheme:
            TextTheme(headline1: TextStyle(color: Colors.blue, fontSize: 100)),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeStack(),
        '/productstack': (context) => ProductStack(),
        '/teststack': (context) => TestStack(),
        '/newsstack': (context) => NewsStack()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
