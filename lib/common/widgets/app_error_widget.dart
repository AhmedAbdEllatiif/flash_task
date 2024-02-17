import 'package:flutter/material.dart';

import '../themes/theme_color.dart';

class AppErrorWidget extends StatelessWidget {
  final String text;
  final Function() onTryAgainPressed;

  const AppErrorWidget({
    Key? key,
    required this.text,
    required this.onTryAgainPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// error icon
          const Icon(
            Icons.error_outline,
            color: AppColor.red,
            size: 100,
          ),

          /// error text
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(text),
          ),

          /// try again
          TextButton(
            onPressed: onTryAgainPressed,
            child: Text(
              "Try again",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.accent,
                    color: AppColor.accent,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
