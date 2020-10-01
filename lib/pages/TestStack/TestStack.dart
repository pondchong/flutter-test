import 'package:flutter/material.dart';
import 'package:fluttertest/pages/TestStack/TestPage.dart';

class TestStack extends StatefulWidget {
  TestStack({Key key}) : super(key: key);

  @override
  _TestStackState createState() => _TestStackState();
}

class _TestStackState extends State<TestStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'teststack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'teststack/home':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => TestPage();
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
