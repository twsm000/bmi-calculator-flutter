import 'package:flutter/material.dart';

import 'constant_types.dart';

class FullWidthButton extends StatelessWidget {
  final String label;
  final Function onPress;
  FullWidthButton({@required this.label, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: Center(
          child: Text(
            this.label,
            style: buttonTextStyle,
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
