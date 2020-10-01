import 'package:flutter/material.dart';
import 'package:fluttertest/models/Detail.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map course;
  List<Chapter> chapter;
  bool isLoading = true;
  final fNumber = NumberFormat('#,###');
  void onPressed() {
    Navigator.pushNamed(context, '/contact');
  }

  @override
  void initState() {
    super.initState();
    print('init');
    Future.delayed(Duration.zero, () {
      print('init delay');
      getData(course['id']);
    });
  }

  getData(int id) async {
    var url = 'https://api.codingthailand.com/api/course/$id';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        chapter = Detail.fromJson(jsonResponse).chapter;
        isLoading = false;
      });
      print(response.body);
      // print('Number of course : ${course.length}.');
    } else {
      print('Error ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    course = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(course['title']),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(chapter[index].chTitle),
                    subtitle: Text(chapter[index].chDateadd),
                    trailing: Chip(
                      label: Text(
                          'Views : ${fNumber.format(chapter[index].chView)}'),
                    ),
                    onTap: () {
                      // Navigator.pushNamed(context, 'productstack/detail',
                      //     arguments: {
                      //       'id': chapter[index].id,
                      //       'title': chapter[index].title
                      //     });
                    });
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: chapter.length),
    );
  }
}
