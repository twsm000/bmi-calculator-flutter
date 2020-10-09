import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;
  final EdgeInsetsGeometry margin;
  final DecorationImage image;

  ReusableCard({
    @required this.color,
    this.child,
    this.onPress,
    this.margin,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        margin: this.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: this.color,
          image: this.image,
        ),
        child: this.child,
      ),
    );
  }
}
