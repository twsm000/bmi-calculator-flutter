import 'package:flutter/material.dart';

import '../constants.dart';

class IconLabeled extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  IconLabeled({this.icon, this.iconColor, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          color: this.iconColor,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
