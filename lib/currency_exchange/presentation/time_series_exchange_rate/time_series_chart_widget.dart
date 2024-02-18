import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/exchange_time_series.dart';

class TimeSeriesChartWidget extends StatefulWidget {
  /// TimeSeriesExchangeEntity
  final TimeSeriesExchangeEntity timeSeriesExchangeEntity;

  const TimeSeriesChartWidget(
      {super.key, required this.timeSeriesExchangeEntity});

  @override
  State<TimeSeriesChartWidget> createState() => _TimeSeriesChartWidgetState();
}

class _TimeSeriesChartWidgetState extends State<TimeSeriesChartWidget> {
  /// available rates
  late final Map<String, num> rates;

  @override
  void initState() {
    super.initState();

    // init rates
    rates = widget.timeSeriesExchangeEntity.rates;
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SingleChildScrollView(
      child: SizedBox(
        height: isPortrait
            ? MediaQuery.of(context).size.height / 1.3
            : MediaQuery.of(context).size.height / 1.6,
        width: MediaQuery.of(context).size.width,
        child: LineChart(
          LineChartData(
            minX: 1,
            maxX: 12,
            minY: 24,
            maxY: 35,

            /// borderData
            borderData: FlBorderData(
                show: true, border: Border.all(color: Colors.grey, width: 2)),

            /// titlesData
            titlesData: FlTitlesData(
              show: true,
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (__, _) => const SizedBox.shrink(),
                  reservedSize: 35,
                ),
              ),
            ),

            /// gridData
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey[500], strokeWidth: 1);
              },
            ),

            /// lineBarsData
            lineBarsData: [
              LineChartBarData(
                isStepLineChart: true,
                isCurved: true,
                barWidth: 3,
                belowBarData: BarAreaData(show: true),
                spots: rates.entries.map((e) {
                  return FlSpot(double.parse(e.key), e.value.toDouble());
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
