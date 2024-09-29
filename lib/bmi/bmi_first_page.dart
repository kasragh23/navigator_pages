import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navigator_pages/gender_enum.dart';
import 'package:navigator_pages/bmi_second_page.dart';

import 'bmi_enum.dart';

class BmiFirstPage extends StatefulWidget {
  const BmiFirstPage({super.key});

  @override
  State<BmiFirstPage> createState() => _BmiFirstPageState();
}

class _BmiFirstPageState extends State<BmiFirstPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  Gender gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bmi calculator'),
        ),
        body: _body());
  }

  Widget _body() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _name(),
            _verticalGap(),
            _weight(),
            _verticalGap(),
            _height(),
            _verticalGap(),
            genderSelection(),
            _verticalGap(),
            calculateButton(),
            _verticalGap(),
          ],
        ),
      ),
    );
  }

  Widget _verticalGap() => const SizedBox(
        height: 15,
      );

  Widget _horizontalGap() => const SizedBox(width: 15);

  Widget _name() => TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(labelText: 'Name'),
        validator: (value) =>
            value == null || value.isEmpty ? 'required' : null,
      );

  Widget _height() => TextFormField(
        controller: _heightController,
        decoration: const InputDecoration(labelText: 'Height'),
        validator: (value) =>
            value == null || value.isEmpty ? 'required' : null,
        keyboardType: TextInputType.number,
      );

  Widget _weight() => TextFormField(
        controller: _weightController,
        decoration: const InputDecoration(labelText: 'Weight'),
        validator: (value) =>
            value == null || value.isEmpty ? 'required' : null,
      );

  Widget genderSelection() => Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: const Text('Male'),
                leading: Radio(
                  activeColor: const Color.fromARGB(1000, 350, 15, 350),
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
            ),
            _horizontalGap(),
            Expanded(
              child: ListTile(
                title: const Text('Female'),
                leading: Radio(
                  activeColor: Colors.deepPurple,
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Widget calculateButton() => ElevatedButton(
        onPressed: _onCalculateTap,
        child: const Text('calculate'),
      );

  Future<void> _onCalculateTap() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text;
      final weight = double.parse(_weightController.text);
      final height =
          double.parse(_heightController.text) / 100; // Convert cm to meters
      final bmiValue = (weight / (pow(height, 2)).floorToDouble());
      final bmiValueFormatted = bmiValue.toStringAsFixed(2);
      final bmiType = _getBmiType(bmiValue);
      bool? result = await Navigator.push<bool?>(
        context,
        MaterialPageRoute(
          builder: (context) => BmiSecondPage(
            bmiType: bmiType,
            bmiValue: double.parse(bmiValueFormatted),
            name: name,
            gender: gender,
          ),
        ),
      );
      if (result != null) {
        if (result) {
          _nameController.clear();
          _heightController.clear();
          _weightController.clear();
          gender = Gender.male;
        }
      }
    }
  }

  BmiEnum _getBmiType(double bmiValue) {
    if (bmiValue < 18.5) {
      return BmiEnum.underWeight;
    } else if (bmiValue < 24.9) {
      return BmiEnum.normal;
    }
    return BmiEnum.overWeight;
  }
}
