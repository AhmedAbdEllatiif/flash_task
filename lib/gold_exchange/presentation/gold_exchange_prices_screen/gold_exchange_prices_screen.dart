import 'package:flash_task/common/widgets/loading_widget.dart';
import 'package:flash_task/gold_exchange/constants/enums/metal_type_enum.dart';
import 'package:flash_task/gold_exchange/logic/get_gold_exchange_cubit.dart';
import 'package:flash_task/gold_exchange/presentation/gold_exchange_prices_screen/gold_exhange_prices_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/functions/git_it_instance.dart';
import '../../../common/themes/theme_color.dart';
import '../../../common/widgets/app_error_widget.dart';

class GoldExchangePricesScreen extends StatefulWidget {
  const GoldExchangePricesScreen({Key? key}) : super(key: key);

  @override
  State<GoldExchangePricesScreen> createState() =>
      _GoldExchangePricesScreenState();
}

class _GoldExchangePricesScreenState extends State<GoldExchangePricesScreen>
    with AutomaticKeepAliveClientMixin {
  late final GetGoldExchangeCubit _goldExchangeCubit;

  @override
  void initState() {
    super.initState();
    // init _exchangeRateCubit
    _goldExchangeCubit = getItInstance<GetGoldExchangeCubit>();

    // fetch exchange rate
    _fetchGoldExchange();
  }

  @override
  void dispose() {
    _goldExchangeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => _goldExchangeCubit,
      child: Builder(builder: (context) {
        return BlocBuilder<GetGoldExchangeCubit, GetGoldExchangeState>(
          builder: (context, state) {
            ///
            ///
            /// loading
            ///
            if (state is LoadingGoldExchange) {
              return const Center(
                child: LoadingWidget(),
              );
            }

            ///
            ///
            /// Quota exceeded
            ///
            if (state is InvalidApiKeyGoldExchange) {
              return AppErrorWidget(
                text: "Invalid Api Key",
                onTryAgainPressed: () => _fetchGoldExchange(),
              );
            }

            ///
            ///
            /// Success
            ///
            if (state is GoldExchangeFetched) {
              return RefreshIndicator(
                onRefresh: () async {
                  _fetchGoldExchange();
                },
                color: AppColor.accent,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 5,
                    right: 5,
                  ),
                  child: GoldExchangePriceListWidget(
                    prices: state.goldExchangeEntity.prices,
                  ),
                ),
              );
            }

            ///
            ///
            /// unExpected Error
            ///
            if (state is ErrorWhileGodExchange) {
              return AppErrorWidget(
                text: "Something went wrong",
                onTryAgainPressed: () => _fetchGoldExchange(),
              );
            }

            return const SizedBox.shrink();
          },
        );
      }),
    );
  }

  /// to fetch the exchange rate
  void _fetchGoldExchange() {
    _goldExchangeCubit.tryToFetchGoldExchange(
        metalType: MetalType.gold, currencyCode: "EGP");
  }

  @override
  bool get wantKeepAlive => true;
}
