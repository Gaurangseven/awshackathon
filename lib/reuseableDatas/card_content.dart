import 'package:flutter/material.dart';
import 'constant.dart';

class CardContent extends StatelessWidget {
  const CardContent({Key? key, required this.label, required this.image}) : super(key: key);

  final String label;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/$image.png',
            height: 130,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Text(label,style: ktitle,textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}



