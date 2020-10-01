import 'package:flutter/material.dart';
// import 'package:fluttertest/models/News.dart';
import 'package:fluttertest/widgets/menu.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> articles = [];
  int totalResult = 0;
  bool isLoading = true;
  getData() async {
    try {
      var url =
          'https://newsapi.org/v2/top-headlines?country=th&apiKey=32629847efb14254ac117b976ce571a7';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        setState(() {
          totalResult = jsonResponse["totalResults"];
          articles = jsonResponse["articles"];
          // course = News.fromJson(jsonResponse).course;
          isLoading = false;
        });
        print(response.body);
        print('Number of news : ${articles.length}.');
      } else {
        setState(() {
          isLoading = false;
        });
        print('Error ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
      setState(() {
        isLoading = false;
      });
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
          title:
              totalResult > 0 ? Text('ข่าวสารทั้งหมด $totalResult ข่าว') : null,
          centerTitle: true,
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'newsstack/webview',
                            arguments: {
                              "url": articles[index]['url'],
                              "name": articles[index]['source']['name']
                            });
                        print('tab');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    child: articles[index]['urlToImage'] != null
                                        ? Ink.image(
                                            image: NetworkImage(
                                                articles[index]['urlToImage']),
                                            fit: BoxFit.cover,
                                          )
                                        : Ink.image(
                                            image: NetworkImage(
                                                'https://picsum.photos/500/200'),
                                            fit: BoxFit.cover,
                                          )),
                                Positioned(
                                  bottom: 16,
                                  left: 16,
                                  top: 16,
                                  right: 16,
                                  child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        articles[index]['source']['name'],
                                        style: TextStyle(color: Colors.white70),
                                      )),
                                )
                              ],
                            ),
                            height: 200,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                            child: Column(
                              children: [
                                Text(articles[index]['title']),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Chip(
                                      avatar: Icon(Icons.person_pin),
                                      label: (articles[index]['author']
                                                      ?.length ??
                                                  0) <
                                              20
                                          ? Text(articles[index]['author'] ??
                                              'นิรนาม')
                                          : Text(articles[index]['author']
                                              .toString()
                                              .substring(0, 20)),
                                    ),
                                    Text(DateFormat.yMd().add_Hms().format(
                                        DateTime.parse(
                                            articles[index]['publishedAt'])))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: articles.length));
  }
}
