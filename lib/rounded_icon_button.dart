import 'package:flutter/material.dart';

import 'constant_types.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  RoundIconButton({@required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      shape: CircleBorder(),
      fillColor: buttonColor,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: this.icon,
    );
  }
}
