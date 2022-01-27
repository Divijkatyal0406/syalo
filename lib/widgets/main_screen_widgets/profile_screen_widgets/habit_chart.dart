import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class HabitChart extends StatelessWidget {
  const HabitChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(enabled: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 1),
              FlSpot(1, 1),
              FlSpot(2, 3),
              FlSpot(3, 4),
              FlSpot(3, 5),
              FlSpot(4, 4)
            ],
            isCurved: true,
            barWidth: 2,
            colors: [
              Colors.blue,
            ],
            dotData: FlDotData(
              show: true,
            ),
          ),
        ],
        minY: 0,
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 3,
              // textStyle: yearTextStyle,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 0:
                    return '2016';
                  case 1:
                    return '2017';
                  default:
                    return '';
                }
              }),
          leftTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              return '${value + 100}';
            },
          ),
        ),
        axisTitleData: FlAxisTitleData(
            leftTitle: AxisTitle(
                showTitle: true, titleText: 'Value', margin: 10),
            bottomTitle: AxisTitle(
                showTitle: true,
                margin: 10,
                titleText: 'Year',
                textStyle: TextStyle(),
                textAlign: TextAlign.right)),
      ),
    );
  }
}


