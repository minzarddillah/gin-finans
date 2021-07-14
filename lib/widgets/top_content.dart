import 'package:flutter/material.dart';

class TopContent extends StatelessWidget {
  final String title;
  final String subtitle;

  TopContent({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            subtitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
