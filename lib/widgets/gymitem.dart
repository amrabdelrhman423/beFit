import 'package:flutter/material.dart';

class GymItem extends StatelessWidget {
  String imageUrl;
  String gymName;
  GymItem(this.imageUrl, this.gymName);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 150,
            fit: BoxFit.fill,
          ),
          Text(
            gymName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      // padding: const EdgeInsets.all(8),
    );
  }
}
