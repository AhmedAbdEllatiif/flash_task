import 'package:flash_task/common/extensions/size_extensions.dart';
import 'package:flash_task/common/themes/theme_color.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/sizes.dart';

class GoldExchangePriceListWidget extends StatelessWidget {
  final Map<String, num> prices;

  const GoldExchangePriceListWidget({
    Key? key,
    required this.prices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,

      /// count
      itemCount: prices.length,

      /// separator
      separatorBuilder: (context, index) => SizedBox(height: Sizes.dimen_2.h),

      /// builder
      itemBuilder: (context, index) {
        var key = prices.keys.elementAt(index);
        var value = prices[key];
        return Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //>> price
                Column(
                  children: [
                    Text(
                      "PRICE (EGP)",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.normal, color: AppColor.gray),
                    ),
                    Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),

                //>> weight
                Column(
                  children: [
                    Text(
                      "KARAT",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.normal, color: AppColor.gray),
                    ),
                    Text(
                      key,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
