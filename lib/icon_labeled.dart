import 'package:flutter/material.dart';

import 'constant_types.dart';

class IconLabeled extends StatelessWidget {
  final IconData icon;
  final String label;

  IconLabeled(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
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
