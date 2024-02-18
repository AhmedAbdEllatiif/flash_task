import 'package:flash_task/common/extensions/size_extensions.dart';
import 'package:flash_task/common/themes/theme_color.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/app_utils.dart';
import '../../../common/constants/sizes.dart';

class LatestExchangeWithEur extends StatelessWidget {
  /// currency rate
  final String rate;

  const LatestExchangeWithEur({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),

      /// container decoration
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.black, width: 2.0),
        borderRadius: BorderRadius.circular(AppUtils.cornerRadius.w),
      ),

      /// text rate
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_1.h),
          child: Text.rich(
            TextSpan(
              children: [
                /// rate
                TextSpan(
                  text: rate,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                ),

                /// EGP
                TextSpan(
                  text: ' EUR/EGP',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.5,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
