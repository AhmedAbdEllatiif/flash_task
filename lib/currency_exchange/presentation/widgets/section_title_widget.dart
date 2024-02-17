import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  final String text;
  final EdgeInsets? margin;

  const SectionTitleWidget({
    Key? key,
    required this.text,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              height: 1,
            ),
      ),
    );
  }
}
