import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Saturacao extends StatefulWidget {
  const Saturacao({super.key});

  @override
  State<Saturacao> createState() => _SaturacaoState();
}

class _SaturacaoState extends State<Saturacao> {
  List<FlSpot> dados = [
    FlSpot(0, 99),
    FlSpot(1, 94),
    FlSpot(2, 98),
    FlSpot(3, 99),
    FlSpot(4, 98),
    FlSpot(5, 97),
    FlSpot(6, 97)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Saturação de Oxigênio: ${dados[dados.length - 1].y.toInt()}%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 0, 10),
          child: LineChart(LineChartData(
              minX: 0,
              maxX: dados.length > 12 ? 12 : dados.length.toDouble() - 1,
              minY: 80,
              maxY: 110,
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
                          getTitlesWidget: (value, meta) {
                            // Only display titles between 50 and 100
                            if (value >= 50 && value <= 100) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  value.toInt().toString(),
                                ),
                              );
                            }
                            return const SizedBox
                                .shrink(); // Don't show other titles
                          },
                          showTitles: true,
                          interval: 5,
                          reservedSize: 40)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, interval: 1, reservedSize: 30))),
              gridData: FlGridData(
                verticalInterval: 1,
                horizontalInterval: 1,
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
                              Colors.blueAccent.withOpacity(0.3),
                              Colors.transparent
                            ])),
                    gradient: LinearGradient(colors: [
                      Colors.deepPurpleAccent.shade200,
                      Colors.indigoAccent
                    ]),
                    barWidth: 5)
              ])),
        )));
  }
}
