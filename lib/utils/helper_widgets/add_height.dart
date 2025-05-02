import 'package:flutter/material.dart';

import '../screen_helper.dart';

class AddHeight extends StatelessWidget {
  final double percentage;
  const AddHeight(
    this.percentage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenHelper.getScreenHeight(context) * percentage,
    );
  }
}