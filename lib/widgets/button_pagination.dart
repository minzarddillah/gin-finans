import 'package:flutter/material.dart';

class ButtonPagination extends StatelessWidget {
  final String title;
  final bool isActive;

  ButtonPagination({
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: isActive ? Colors.green : Colors.white,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
