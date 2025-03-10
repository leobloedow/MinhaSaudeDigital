import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PacDashboard extends StatefulWidget {
  const PacDashboard({super.key});

  @override
  State<PacDashboard> createState() => _PacDashboardState();
}

class _PacDashboardState extends State<PacDashboard> {
  final String _pacNome = "Leonardo";
  final String _pacSobr = "Littig";
  final double _passos = 4000;
  final double _passosMeta = 5000;
  final int _idade = 20;
  final double _peso = 63;
  final double _altura = 181;
  final String _tipoSang = "A+";
  final DateTime _data = DateTime.now().subtract(Duration(hours: 3));
  final int _freq = 101;
  final int _satur = 97;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "$_pacNome $_pacSobr",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/perf_completo');
                        },
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        icon: Icon(
                          Icons.person_rounded,
                          color: Colors.grey,
                          size: 65,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$_idade anos"),
                            Text("$_peso Kg"),
                            Text("$_altura cm"),
                            Text(_tipoSang)
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${_passos.toStringAsFixed(0)} / ${_passosMeta.toStringAsFixed(0)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Text(
              "${_data.day} . ${_data.month} . ${_data.year}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  shadows: [Shadow(offset: Offset(0, -5))],
                  color: Colors.transparent,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 75,
                      width: 75,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.heartPulse,
                          size: 50,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25)),
                      height: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            surfaceTintColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: Colors.transparent,
                            foregroundColor:
                                const Color.fromARGB(255, 27, 26, 26),
                            elevation: 0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/freq_card');
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Frequência Cardíaca:"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "$_freq",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text("bpm"),
                                        )
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 75,
                      width: 75,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "SpO₂",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent[700]),
                            ),
                            FaIcon(
                              Icons.water_drop_rounded,
                              size: 50,
                              color: Colors.deepPurpleAccent[700],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25)),
                      height: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            surfaceTintColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.black,
                            elevation: 0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/saturacao');
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Saturação de Oxigênio:"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "$_satur",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text("%"),
                                        )
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.blue[100]),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/chatscreen');
                          },
                          icon: Icon(
                            Icons.chat,
                            color: Colors.blue,
                          ),
                          iconSize: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          "Acessar\nChat",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.green[100]),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/perf_completo',
                            );
                          },
                          icon: Icon(
                            Icons.person_rounded,
                            color: Colors.green,
                          ),
                          iconSize: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          "Perfil\nCompleto",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.amber[100]),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => PopScope(
                                        child: AlertDialog(
                                      title: Center(
                                        child: Text(
                                          "Contato de Emergência:",
                                          style: TextStyle(fontSize: 32),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      actions: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Chamar ambulância",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Ligar para o hospital",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Ligar para familiar",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.redAccent),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Cancelar",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              )),
                                        )
                                      ],
                                    )));
                          },
                          icon: Icon(
                            Icons.warning_rounded,
                            color: Colors.amber,
                          ),
                          iconSize: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          "Contato de\nEmergência",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
