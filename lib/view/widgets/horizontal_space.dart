import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double space;

  HorizontalSpace({this.space});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:space,
    );
  }
}