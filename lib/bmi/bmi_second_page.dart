import 'package:flutter/material.dart';
import 'package:navigator_pages/bmi_enum.dart';
import 'package:navigator_pages/gender_enum.dart';

class BmiSecondPage extends StatelessWidget {
  const BmiSecondPage({
    super.key,
    required this.bmiType,
    required this.bmiValue,
    required this.name,
    required this.gender,
  });

  //final int counter;
  final BmiEnum bmiType;
  final double bmiValue;
  final String name;
  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Result'),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${gender.title} $name',
              style: const TextStyle(fontSize: 22),
            ),
            _gap(),
            Text(
              'BMI : $bmiValue',
              style: TextStyle(color: _color, fontSize: 20),
            ),
            _gap(),
            Text(
              'You are in the ${bmiType.label} range ',
              style: TextStyle(color: _color, fontSize: 20),
            ),
            _bigGap(),
            _resetButton(context)
          ],
        ),
      ),
    );
  }

  Widget _resetButton(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _onReset(context),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'RESET',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ));
  }

  SizedBox _gap() => const SizedBox(height: 10);

  SizedBox _bigGap() => const SizedBox(height: 60);

  Color get _color => bmiType.color;

  void _onReset(BuildContext context) {
    Navigator.pop(context, true);
  }
}
