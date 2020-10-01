import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  CompanyPage({Key key}) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('test'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
              // Image.asset(
              //   'assets/images/bg.png',
              //   height: 300,
              //   fit: BoxFit.fill,
              // ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company Name',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porta purus leo, quis egestas dui accumsan et. Maecenas convallis massa nulla, vit',
                        textAlign: TextAlign.justify,
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      buildContact(),
                      Divider(),
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          10,
                          (index) => Chip(
                            label: Text('Gift ${index + 1}'),
                            avatar: Icon(
                              Icons.cake,
                              size: 20,
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                      Divider(),
                      buildFooter()
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Row buildContact() {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.phone_android,
              color: Colors.amber,
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Suphanat Untimanon',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            Row(
              children: [
                Text('0982728939'),
              ],
            )
          ],
        )
      ],
    );
  }

  Row buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/food1.jpg'),
          radius: 40,
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/food2.jpg'),
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/food3.png'),
        ),
        SizedBox(
          width: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.ac_unit),
              Icon(Icons.add_a_photo),
              Icon(Icons.wifi)
            ],
          ),
        )
      ],
    );
  }
}
