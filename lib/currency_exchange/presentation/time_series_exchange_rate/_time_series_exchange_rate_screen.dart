import 'package:flash_task/common/functions/git_it_instance.dart';
import 'package:flash_task/currency_exchange/logic/time_series_exchange_rate/get_time_series_rate_cubit.dart';
import 'package:flash_task/currency_exchange/presentation/time_series_exchange_rate/time_series_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/app_error_widget.dart';
import '../../../common/widgets/loading_widget.dart';

class TimeSeriesExchangeRateScreen extends StatefulWidget {
  const TimeSeriesExchangeRateScreen({super.key});

  @override
  State<TimeSeriesExchangeRateScreen> createState() =>
      _TimeSeriesExchangeRateScreenState();
}

class _TimeSeriesExchangeRateScreenState
    extends State<TimeSeriesExchangeRateScreen> {
  // GetTimeSeriesRateCubit
  late final GetTimeSeriesRateCubit _timeSeriesRateCubit;

  @override
  void initState() {
    super.initState();
    _timeSeriesRateCubit = getItInstance<GetTimeSeriesRateCubit>();

    _fetchTimeSeriesRate();
  }

  @override
  void dispose() {
    _timeSeriesRateCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _timeSeriesRateCubit,
      child: Scaffold(
        //backgroundColor: Colors.grey[600],

        /// appBar
        appBar: AppBar(title: const Text("Time Series of 2023")),

        /// body
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          child: BlocBuilder<GetTimeSeriesRateCubit, GetTimeSeriesRateState>(
            builder: (context, state) {
              ///
              ///
              /// Loading
              ///
              if (state is LoadingTimeSeriesRate) {
                return const Center(
                  child: LoadingWidget(),
                );
              }

              ///
              ///
              /// success
              ///
              if (state is TimeSeriesRateFetched) {
                return TimeSeriesChartWidget(
                  timeSeriesExchangeEntity: state.timeSeriesRateEntity,
                );
              }

              ///
              ///
              /// unExpected Error
              ///
              if (state is ErrorWhileTimeSeriesRate) {
                return AppErrorWidget(
                  text: "Something went wrong",
                  onTryAgainPressed: () => _fetchTimeSeriesRate(),
                );
              }

              /// default
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  /// to fetch the timeSeries exchange rate
  void _fetchTimeSeriesRate() {
    _timeSeriesRateCubit.tryToFetchTimeSeriesExchangeRate();
  }
}
