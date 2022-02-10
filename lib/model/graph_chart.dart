// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphChart extends StatefulWidget {
  const GraphChart({Key? key}) : super(key: key);

  @override
  _GraphChartState createState() => _GraphChartState();
}

class _GraphChartState extends State<GraphChart> {
  List<Color> gradientColors = [Colors.blue.withOpacity(.45)];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: LineChart(mainData()),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color(0xffffffff).withOpacity(0.08),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
            color: Color(0xff818496).withOpacity(0.7),
            fontWeight: FontWeight.w200,
            fontSize: 12,
            decoration: TextDecoration.none,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '11';
              case 1:
                return '12';
              case 2:
                return '13';
              case 3:
                return '14';
              case 4:
                return '15';
              case 5:
                return '16';
              case 6:
                return '17';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
            color: Color(0xff818496).withOpacity(0.7),
            fontWeight: FontWeight.w200,
            fontSize: 12,
            decoration: TextDecoration.none,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 1:
                return '10';
              case 2:
                return '20';
              case 3:
                return '30';
              case 4:
                return '40';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xffffffff).withOpacity(0.08),
          ),
        ),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1.1),
            FlSpot(0.3, 0.8),
            FlSpot(0.7, 1.8),
            FlSpot(1.3, 0.2),
            FlSpot(2.1, 1.9),
            FlSpot(2.8, 3),
            FlSpot(3, 0.8),
            FlSpot(3.8, 1.5),
            FlSpot(4.9, 0.5),
            FlSpot(5.5, 2.5),
            FlSpot(6, 1.5),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.05)).toList(),
          ),
        ),
      ],
    );
  }
}
