import 'package:flutter/material.dart';
import 'package:gin_finans/widgets/button_next.dart';
import 'package:gin_finans/widgets/dropdown.dart';
import 'package:gin_finans/widgets/top_content.dart';

class InputPersonalInformation extends StatefulWidget {
  final bool showButtonNext;
  final Function onPressNext;

  InputPersonalInformation({
    required this.showButtonNext,
    required this.onPressNext,
  });

  @override
  _InputPersonalInformationState createState() =>
      _InputPersonalInformationState();
}

class _InputPersonalInformationState extends State<InputPersonalInformation> {
  String? _goalValue = '- Choose Option -';
  String? _monthlyIncomeValue = '- Choose Option -';
  String? _monthlyExpenceValue = '- Choose Option -';

  void onChangeGoal(value) {
    setState(() {
      _goalValue = value!;
    });
  }

  void onChangeMonthlyIncome(value) {
    setState(() {
      _monthlyIncomeValue = value;
    });
  }

  void onChangeMonthlyExpence(value) {
    setState(() {
      _monthlyExpenceValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopContent(
                title: 'Personal Information',
                subtitle:
                    'Please fill in the information below and your goal for digital saving',
              ),
              Column(
                children: [
                  Dropdown(
                    chosenValue: _goalValue,
                    onChange: onChangeGoal,
                    items: ['- Choose Option -', 'One', 'Two', 'Three'],
                    label: 'Goal for activation',
                  ),
                  Dropdown(
                    chosenValue: _monthlyIncomeValue,
                    onChange: onChangeMonthlyIncome,
                    items: ['- Choose Option -', 'One', 'Two', 'Three'],
                    label: 'Goal for activation',
                  ),
                  Dropdown(
                    chosenValue: _monthlyExpenceValue,
                    onChange: onChangeMonthlyExpence,
                    items: ['- Choose Option -', 'One', 'Two', 'Three'],
                    label: 'Goal for activation',
                  ),
                ],
              ),
            ],
          ),
        ),
        widget.showButtonNext
            ? ButtonNext(() => widget.onPressNext())
            : Container(),
      ],
    );
  }
}
