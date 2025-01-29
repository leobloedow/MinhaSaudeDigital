import 'package:flutter/material.dart';

class PerfilCompleto extends StatefulWidget {
  const PerfilCompleto({super.key});

  @override
  State<PerfilCompleto> createState() => _PerfilCompletoState();
}

class _PerfilCompletoState extends State<PerfilCompleto> {
  final String _pacNome = "Leonardo";
  final String _pacSobr = "Littig";
  final double _passos = 4000;
  final double _passosMeta = 5000;
  final int _idade = 20;
  final String _nascimento = '25/07/2004';
  final double _peso = 63;
  final double _altura = 181;
  final String _tipoSang = "A+";
  final DateTime _data = DateTime.now().subtract(Duration(hours: 3));
  final int _freq = 98;
  final int _satur = 99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$_pacNome $_pacSobr",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.person_rounded,
                color: Colors.grey,
                size: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Data de nascimento: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("$_nascimento")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tipo Sanguíneo: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("$_tipoSang")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Altura: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("$_altura cm")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Massa corporal: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("$_peso Kg")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Meta de passos definida: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${_passosMeta.toStringAsFixed(0)}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "N° de matrícula: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("-------")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
