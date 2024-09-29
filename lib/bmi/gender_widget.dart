import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'gender_enum.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.value,
    required this.onTap,
    this.selectedValue,
  });

  final Gender value;
  final selectedValue;
  final void Function(Gender newValue) onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: _borderRadius(),
        onTap: () => onTap(value),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan),
                borderRadius: _borderRadius(),
                color:
                    selectedValue == value ? Colors.blue : Colors.transparent,
              ),
              child: Text(
                value.label,
                style: TextStyle(
                    color: selectedValue ? Colors.white : Colors.blue),
              )),
        ),
      );

  BorderRadius _borderRadius() => BorderRadius.circular(12);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('selectedValue', selectedValue));
  }
}
