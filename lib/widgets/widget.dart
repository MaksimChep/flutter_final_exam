import 'package:flutter/material.dart';
import '../data/photos.dart';

class PhotoWidget extends StatelessWidget {
  final Photos photo;
  const PhotoWidget({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: {'data': photo});
      },
      child: Hero(
        child: Stack(
          children: [
            Image.network(photo.src),
            Positioned(child: Text(photo.title), left: 5, top: 3),
          ],
        ),
        tag: photo.id,
      ),
    );
  }
}
