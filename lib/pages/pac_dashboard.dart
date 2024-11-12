import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class PacDashboard extends StatefulWidget {
  const PacDashboard({super.key});

  @override
  State<PacDashboard> createState() => _PacDashboardState();
}

class _PacDashboardState extends State<PacDashboard> {
  final String _pacNome = "Nome";
  final String _pacSobr = "Sobrenome";
  double _passos = 4000;
  double _passosMeta = 5000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("$_pacNome $_pacSobr"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 75,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SimpleCircularProgressBar(
                            animationDuration: 1,
                            maxValue: _passosMeta,
                            valueNotifier: ValueNotifier(_passos),
                            size: 75,
                            mergeMode: true,
                            backStrokeWidth: 10,
                            backColor: Colors.grey.shade300,
                            progressColors: [
                              const Color.fromARGB(255, 0, 206, 161),
                              const Color.fromARGB(255, 0, 255, 76)
                            ],
                          ),
                        ),
                        Text(
                            '${_passos.toStringAsFixed(0)} / ${_passosMeta.toStringAsFixed(0)}')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
