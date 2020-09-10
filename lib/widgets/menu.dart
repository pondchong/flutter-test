import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'เมนู',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                selected:
                    ModalRoute.of(context).settings.name == 'homestack/home',
                leading: Icon(Icons.home),
                title: Text('หน้าหลัก'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                }),
            ListTile(
              selected: ModalRoute.of(context).settings.name ==
                  'productstack/product',
              leading: Icon(Icons.shopping_cart),
              title: Text('สินค้า'),
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamedAndRemoveUntil('/productstack', (route) => false);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
