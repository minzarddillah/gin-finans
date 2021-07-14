import 'package:flutter/material.dart';
import 'package:gin_finans/models/complexity_model.dart';

class Complexity extends StatelessWidget {
  final ComplexityModel complexity;

  Complexity({required this.complexity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        complexity.validated
            ? Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            : Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  complexity.title,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
        Text(
          complexity.subtitle,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
