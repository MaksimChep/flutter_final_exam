import 'package:flutter/material.dart';
import 'package:flutter_final_exam/data/photos.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    Photos item = arguments['data'];
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Center(
          child: GestureDetector(
        child: Hero(tag: item.id, child: Image.network(item.src)),
        onTap: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}
