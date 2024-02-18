import 'package:flash_task/common/extensions/size_extensions.dart';
import 'package:flash_task/common/functions/git_it_instance.dart';
import 'package:flash_task/common/themes/theme_color.dart';
import 'package:flash_task/common/widgets/app_error_widget.dart';
import 'package:flash_task/common/widgets/loading_widget.dart';
import 'package:flash_task/currency_exchange/logic/latest_exchange_rate/get_exchange_rate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_utils.dart';
import '../time_series_exchange_rate/_time_series_exchange_rate_screen.dart';
import '../widgets/section_title_widget.dart';
import 'exhange_rates_list.dart';
import 'latest_exchange_with_eur.dart';

class ExchangeRateScreen extends StatefulWidget {
  const ExchangeRateScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeRateScreen> createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen>
    with AutomaticKeepAliveClientMixin {
  late final GetExchangeRateCubit _exchangeRateCubit;

  @override
  void initState() {
    super.initState();
    // init _exchangeRateCubit
    _exchangeRateCubit = getItInstance<GetExchangeRateCubit>();

    // fetch exchange rate
    _fetchExchangeRate();
  }

  @override
  void dispose() {
    _exchangeRateCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => _exchangeRateCubit,
      child: Builder(builder: (context) {
        return BlocBuilder<GetExchangeRateCubit, GetExchangeRateState>(
          builder: (context, state) {
            ///
            ///
            /// loading
            ///
            if (state is LoadingExchangeRate) {
              return const Center(
                child: LoadingWidget(),
              );
            }

            ///
            ///
            /// Quota exceeded
            ///
            if (state is QuotaExceededExchangeRate) {
              return AppErrorWidget(
                text: "Your Quota has been exceeded",
                onTryAgainPressed: () => _fetchExchangeRate(),
              );
            }

            ///
            ///
            /// Bad Access Key
            ///
            if (state is BadAccessKeyExchangeRate) {
              return AppErrorWidget(
                text:
                    "No API Key was specified or an invalid API Key was specified",
                onTryAgainPressed: () => _fetchExchangeRate(),
              );
            }

            ///
            ///
            /// Success
            ///
            if (state is ExchangeRateFetched) {
              return RefreshIndicator(
                onRefresh: () async {
                  _fetchExchangeRate();
                },
                color: AppColor.accent,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  children: [
                    /// section title "Latest Rate to EUR"
                    const SectionTitleWidget(
                      text: "Latest Rate to \"EGP\"",
                    ),

                    /// latest exchange rate to EGP
                    LatestExchangeWithEur(
                        rate: state.exchangeRateEntity.rateToEGP),


                    /// button "2023 TimeSeries"
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.gray),
                            borderRadius:
                                BorderRadius.circular(AppUtils.cornerRadius.w),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "2023 TimeSeries",
                                style: TextStyle(color: AppColor.blue),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: AppColor.blue,
                              )
                            ],
                          ),
                        ),
                        onPressed: () => _navigateToTimeSeriesScreen(),
                      ),
                    ),


                    /// divider
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery.of(context).size.width / 10,
                      ),
                      child: const Divider(
                        color: AppColor.grayFade,
                      ),
                    ),

                    /// section title "Latest Rate to EUR"
                    const SectionTitleWidget(
                      text: "ALL Rates",
                      margin: EdgeInsets.only(bottom: 20),
                    ),

                    /// list of rest rates
                    ExchangeRateList(
                      rates: state.exchangeRateEntity.rates,
                      baseCurrency: state.exchangeRateEntity.baseCurrency,
                    ),
                  ],
                ),
              );
            }

            ///
            ///
            /// unExpected Error
            ///
            if (state is ErrorWhileExchangeRate) {
              return AppErrorWidget(
                text: "Something went wrong",
                onTryAgainPressed: () => _fetchExchangeRate(),
              );
            }

            return const SizedBox.shrink();
          },
        );
      }),
    );
  }

  /// to fetch the exchange rate
  void _fetchExchangeRate() {
    _exchangeRateCubit.tryToFetchExchangeRate(
      baseCurrency: "EUR",
      rateCurrencies: [],
    );
  }

  /// to navigate to TimeSeriesScreen
  void _navigateToTimeSeriesScreen()=> Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
      const TimeSeriesExchangeRateScreen(),
    ),
  );

  @override
  bool get wantKeepAlive => true;
}
