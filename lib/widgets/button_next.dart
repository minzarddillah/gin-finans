import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final VoidCallback onPressed;

  ButtonNext(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.blue[400],
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(child: Text('Next')),
      ),
    );
  }
}
