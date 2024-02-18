import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String text;
  final double? height;
  final TextStyle? textStyle;

  const TabItem({
    Key? key,
    required this.text,
    this.textStyle,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      /// height
      height: height,

      /// child as text
      child: Text(text),
    );
  }
}
