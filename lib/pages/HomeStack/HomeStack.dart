import 'package:flutter/material.dart';
import 'package:fluttertest/pages/HomeStack/AboutPage.dart';
import 'package:fluttertest/pages/HomeStack/ContactPage.dart';
import 'package:fluttertest/pages/HomeStack/HomePage.dart';

class HomeStack extends StatefulWidget {
  HomeStack({Key key}) : super(key: key);

  @override
  _HomeStackState createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => HomePage();
            break;
          case 'homestack/about':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => AboutPage();
            break;
          case 'homestack/contact':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => ContactPage();
            break;
          // case 'signup/choose_credentials':
          //   // Assume ChooseCredentialsPage collects new credentials and then
          //   // invokes 'onSignupComplete()'.
          //   builder = (BuildContext _) => ChooseCredentialsPage(
          //         onSignupComplete: () {
          //           // Referencing Navigator.of(context) from here refers to the
          //           // top level Navigator because SignUpPage is above the
          //           // nested Navigator that it created. Therefore, this pop()
          //           // will pop the entire "sign up" journey and return to the
          //           // "/" route, AKA HomePage.
          //           Navigator.of(context).pop();
          //         },
          //       );
          //   break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
