import 'package:flutter/material.dart';

class DropdownInkwell extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  DropdownInkwell({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 2),
                    child: Text(
                      label,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_down,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
