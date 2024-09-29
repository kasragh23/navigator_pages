import 'package:flutter/material.dart';

enum BmiEnum {
  normal(
      'normal',
      Colors.green,
  ),
  underWeight(
      'under weight',
      Colors.red,
  ),
  overWeight(
      'over weight',
      Colors.red
  );

  factory BmiEnum.fromValue(double value){
    if(value > 25){
      return BmiEnum.overWeight;
    }
    else if(value > 18.5 && value < 25){
      return BmiEnum.normal;
    }
    return BmiEnum.underWeight;
  }

  const BmiEnum(
    this.label,
    this.color,
  );


  final String label;
  final Color color;
}