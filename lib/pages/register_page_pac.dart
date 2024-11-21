// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class RegisterPagePac extends StatefulWidget {
  const RegisterPagePac({super.key});

  @override
  State<RegisterPagePac> createState() => _RegisterPagePacState();
}

class _RegisterPagePacState extends State<RegisterPagePac> {
  bool _acTermos = false;
  String? _selSex = '';
  DateTime? _selData;
  double _altura = 160;
  double _peso = 80;
  final List<String> _tiposSang = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  // ignore: unused_field
  String? _tipoSang = '';

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          _selData = selectedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registro de paciente",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: Row(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/images/hcpa-logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("MINHA\nSAÚDE\nDIGITAL",
                          style: GoogleFonts.karla(
                              letterSpacing: 2,
                              color: Colors.grey,
                              fontSize: 20,
                              height: 1)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Nome completo",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Senha",
                      hintStyle: TextStyle(color: Colors.grey)),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Confirmar senha",
                      hintStyle: TextStyle(color: Colors.grey)),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Sexo:",
                      style: TextStyle(fontSize: 16),
                    ),
                    ListTile(
                      title: Text('Masculino', style: TextStyle(fontSize: 16)),
                      leading: Radio<String>(
                        value: 'm',
                        groupValue: _selSex,
                        onChanged: (String? value) {
                          setState(() {
                            _selSex = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Feminino', style: TextStyle(fontSize: 16)),
                      leading: Radio<String>(
                        value: 'f',
                        groupValue: _selSex,
                        onChanged: (String? value) {
                          setState(() {
                            _selSex = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Tipo sanguíneo:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 100,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            items: _tiposSang
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _tipoSang = value;
                              });
                            },
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Data de nascimento:",
                          style: TextStyle(fontSize: 16)),
                    ),
                    ElevatedButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        _selData == null
                            ? 'Selecionar data'
                            : DateFormat('dd/MM/yyyy').format(_selData!),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Altura:", style: TextStyle(fontSize: 16)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: DecimalNumberPicker(
                              textStyle:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                              selectedTextStyle: TextStyle(fontSize: 24),
                              minValue: 50,
                              maxValue: 250,
                              value: _altura,
                              onChanged: (value) =>
                                  setState(() => _altura = value)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "cm",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Peso:", style: TextStyle(fontSize: 16)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: DecimalNumberPicker(
                              textStyle:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                              selectedTextStyle: TextStyle(fontSize: 24),
                              minValue: 15,
                              maxValue: 500,
                              value: _peso,
                              onChanged: (value) =>
                                  setState(() => _peso = value)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Kg",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _acTermos,
                      onChanged: (value) {
                        setState(() {
                          _acTermos = value!;
                        });
                      },
                    ),
                    Text("Li e aceito os termos da\nPolítica de Privacidade")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _acTermos
                            ? const Color.fromARGB(255, 167, 73, 255)
                            : const Color.fromARGB(255, 231, 204, 255)),
                    child: Text('Registrar',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
