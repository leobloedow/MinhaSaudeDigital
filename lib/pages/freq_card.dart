import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FreqCard extends StatefulWidget {
  const FreqCard({super.key});

  @override
  State<FreqCard> createState() => _FreqCardState();
}

class _FreqCardState extends State<FreqCard> {
  List<FlSpot> dados = [
    FlSpot(0, 80),
    FlSpot(1, 94),
    FlSpot(2, 111),
    FlSpot(3, 152),
    FlSpot(4, 149),
    FlSpot(5, 130),
    FlSpot(6, 101)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Frequência Cardíaca: ${dados[dados.length - 1].y.toInt()}bpm",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 0, 10),
          child: LineChart(LineChartData(
              minX: 0,
              maxX: dados.length > 12 ? 12 : dados.length.toDouble() - 1,
              minY: 0,
              maxY: 200,
              borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 2,
                  )),
              titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                  )),
                  rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, interval: 20, reservedSize: 40)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, interval: 1, reservedSize: 30))),
              gridData: FlGridData(
                verticalInterval: 2,
                horizontalInterval: 20,
                show: true,
                getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color.fromARGB(55, 176, 158, 255),
                    strokeWidth: 2),
                getDrawingVerticalLine: (value) => FlLine(
                    color: const Color.fromARGB(34, 128, 99, 255),
                    strokeWidth: 1),
              ),
              lineBarsData: [
                LineChartBarData(
                    spots: dados,
                    isCurved: true,
                    belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                            transform: GradientRotation(1),
                            colors: [
                              Colors.redAccent.withOpacity(0.3),
                              Colors.transparent
                            ])),
                    gradient: LinearGradient(
                        colors: [Colors.red.shade200, Colors.redAccent]),
                    barWidth: 5)
              ])),
        )));
  }
}
