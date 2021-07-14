import 'package:flutter/material.dart';
import 'package:gin_finans/widgets/button_next.dart';
import 'package:gin_finans/widgets/dropdown.dart';
import 'package:gin_finans/widgets/top_content.dart';

class InputPersonalInformation extends StatefulWidget {
  final bool showButtonNext;
  final Function onPressNext;
  final String? goalValue;
  final String? monthlyIncomeValue;
  final String? monthlyExpenceValue;
  final void Function(String?) onChangeGoal;
  final void Function(String?) onChangeMonthlyIncome;
  final void Function(String?) onChangeMonthlyExpence;

  InputPersonalInformation({
    required this.showButtonNext,
    required this.onPressNext,
    required this.goalValue,
    required this.monthlyIncomeValue,
    required this.monthlyExpenceValue,
    required this.onChangeGoal,
    required this.onChangeMonthlyIncome,
    required this.onChangeMonthlyExpence,
  });

  @override
  _InputPersonalInformationState createState() =>
      _InputPersonalInformationState();
}

class _InputPersonalInformationState extends State<InputPersonalInformation> {
  String get errorMessage {
    const String defaultValue = '- Choose Option -';

    if (widget.goalValue == defaultValue) {
      return 'Goal for activation harus diisi';
    } else if (widget.monthlyIncomeValue == defaultValue) {
      return 'Monthly Income harus diisi';
    } else if (widget.monthlyExpenceValue == defaultValue) {
      return 'Monthly Expence harus diisi';
    }

    return '';
  }

  void onPressButton() {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );

    if (errorMessage.isEmpty) {
      widget.onPressNext();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
                    chosenValue: widget.goalValue,
                    onChange: widget.onChangeGoal,
                    items: ['- Choose Option -', 'One', 'Two', 'Three'],
                    label: 'Goal for activation',
                  ),
                  Dropdown(
                    chosenValue: widget.monthlyIncomeValue,
                    onChange: widget.onChangeMonthlyIncome,
                    items: ['- Choose Option -', 'One', 'Two', 'Three'],
                    label: 'Monthly income',
                  ),
                  Dropdown(
                    chosenValue: widget.monthlyExpenceValue,
                    onChange: widget.onChangeMonthlyExpence,
                    items: ['- Choose Option -', 'One', 'Two', 'Three'],
                    label: 'Monthly expense',
                  ),
                ],
              ),
            ],
          ),
        ),
        widget.showButtonNext ? ButtonNext(onPressButton) : Container(),
      ],
    );
  }
}
