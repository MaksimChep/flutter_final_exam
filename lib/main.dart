import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_final_exam/screens/details_screen.dart';
import 'package:flutter_final_exam/widgets/widget.dart';
import 'data/photos.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Photos> photosList;
  Future<List<Photos>> getPhotos() async {
    var response = await http
        .get(Uri.parse("https://608bd4239f42b20017c3cee6.mockapi.io/photos"));
    return (json.decode(response.body) as List).map((i) => Photos(i)).toList();
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Exam"),
        ),
        body: FutureBuilder<List<Photos>>(
            future: getPhotos(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
              if (snapshot.hasData) {
                photosList = snapshot.data!;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return PhotoWidget(photo: photosList[index]);
                    });
              } else {
                return const Center(
                    child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ));
              }
            }));
  }
}
