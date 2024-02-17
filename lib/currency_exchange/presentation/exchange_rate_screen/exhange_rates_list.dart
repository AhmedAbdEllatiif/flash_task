import 'package:flash_task/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/sizes.dart';

class ExchangeRateList extends StatelessWidget {
  final String baseCurrency;
  final Map<String, num> rates;

  const ExchangeRateList({
    Key? key,
    required this.rates,
    required this.baseCurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,

      /// count
      itemCount: rates.length,

      /// separator
      separatorBuilder: (context, index) => SizedBox(height: Sizes.dimen_2.h),

      /// builder
      itemBuilder: (context, index) {
        var key = rates.keys.elementAt(index);
        var value = rates[key];
        return Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //>> rate
                Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                //>> baseCurrency/correspondingCurrency
                //>> EX: EUR/EGP
                Text(
                  "$baseCurrency/$key",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
