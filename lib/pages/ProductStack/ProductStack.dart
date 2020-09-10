import 'package:flutter/material.dart';

import 'DetailPage.dart';
import 'ProductPage.dart';

class ProductStack extends StatefulWidget {
  ProductStack({Key key}) : super(key: key);

  @override
  _ProductStackState createState() => _ProductStackState();
}

class _ProductStackState extends State<ProductStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'productstack/product',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'productstack/product':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => ProductPage();
            break;
          case 'productstack/detail':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => DetailPage();
            break;

          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
