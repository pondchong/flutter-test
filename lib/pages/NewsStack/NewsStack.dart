import 'package:flutter/material.dart';
import 'package:fluttertest/pages/NewsStack/WebViewPage.dart';

import 'NewsPage.dart';

class NewsStack extends StatefulWidget {
  NewsStack({Key key}) : super(key: key);

  @override
  _NewsStackState createState() => _NewsStackState();
}

class _NewsStackState extends State<NewsStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'newsstack/news',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'newsstack/news':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => NewsPage();
            break;
          case 'newsstack/webview':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => WebViewPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
