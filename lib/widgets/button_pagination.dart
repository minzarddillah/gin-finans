import 'package:flutter/material.dart';

class ButtonPagination extends StatelessWidget {
  final String title;
  final Function onPressed;
  final int index;
  final bool isActive;
  final bool disabled;

  ButtonPagination({
    required this.title,
    required this.onPressed,
    required this.index,
    required this.isActive,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: ElevatedButton(
        onPressed: () => {
          if (!disabled) {onPressed(index)}
        },
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30),
          ),
          side: BorderSide(color: Colors.black),
          primary: isActive ? Colors.green : Colors.white,
          onPrimary: Colors.black,
          elevation: 0,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
