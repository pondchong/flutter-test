import 'package:flutter/material.dart';
// import 'package:fluttertest/models/Room.dart';
import 'package:fluttertest/widgets/menu.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class RoomPage extends StatefulWidget {
  RoomPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List<dynamic> room = [];
  bool isLoading = true;
  getData() async {
    var url = 'https://codingthailand.com/api/get_rooms.php';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        room = jsonResponse;
        // course = Room.fromJson(jsonResponse).course;
        isLoading = false;
      });
      print(response.body);
      print('Number of course : ${room.length}.');
    } else {
      setState(() {
        isLoading = false;
      });
      print('Error ${response.statusCode}');
    }
  }

  @override
  void initState() {
    getData();

    super.initState();
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
          title: Text('ห้องพัก'),
          centerTitle: true,
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(room[index]['id']),
                      subtitle: Text(room[index]['name']),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.pushNamed(context, 'productstack/detail',
                            arguments: {
                              'id': room[index]['id'],
                              'name': room[index]['name']
                            });
                      });
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: room.length));
  }
}
