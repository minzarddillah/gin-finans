import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final String? chosenValue;
  final void Function(String?) onChange;
  final List<String> items;
  final String label;

  Dropdown({
    required this.chosenValue,
    required this.onChange,
    required this.items,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(top: 14),
      child: DropdownButtonFormField(
        value: chosenValue,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        // hint: Text('- Choose Option -'),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
        onChanged: onChange,
      ),
    );
  }
}
