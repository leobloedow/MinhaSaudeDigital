// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<bool> _selPacMed = [true, false];
  bool _acTermos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          child: Image.asset(
                            'assets/images/hcpa-logo.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("MINHA\nSAÚDE\nDIGITAL",
                              style: GoogleFonts.karla(
                                  letterSpacing: 2,
                                  color: Colors.grey,
                                  fontSize: 20,
                                  height: 1)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 30, 8, 30),
                  child: ToggleButtons(
                    selectedColor: Colors.white,
                    color: Colors.grey,
                    fillColor: Color.fromRGBO(86, 187, 140, 1),
                    borderRadius: BorderRadius.circular(10),
                    isSelected: _selPacMed,
                    onPressed: (int index) {
                      setState(() {
                        if (index == 0) {
                          _selPacMed[0] = true;
                          _selPacMed[1] = false;
                        } else {
                          _selPacMed[1] = true;
                          _selPacMed[0] = false;
                        }
                      });
                    },
                    children: [
                      SizedBox(
                          width: 100,
                          child: Center(
                              child: Text(
                            "Paciente",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ))),
                      SizedBox(
                          width: 100,
                          child: Center(
                              child: Text("Médico",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold))))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Email",
                        hintStyle: GoogleFonts.poppins(color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Senha",
                        hintStyle: GoogleFonts.poppins(color: Colors.grey)),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Esqueci minha senha/usuário",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Checkbox(
                          value: _acTermos,
                          onChanged: (value) {
                            setState(() {
                              _acTermos = value!;
                            });
                          },
                        ),
                      ),
                      Flexible(
                          flex: 3,
                          child: Text(
                              "Li e aceito os termos da\nPolítica de Privacidade"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_selPacMed[0]) {
                          Navigator.pushNamed(context, '/pac_dashboard');
                        } else if (_selPacMed[1]) {}
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _acTermos
                              ? Color.fromRGBO(86, 187, 140, 1)
                              : Color.fromRGBO(180, 240, 212, 1)),
                      child: Text('Entrar',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_selPacMed[0]) {
                              Navigator.pushNamed(
                                  context, '/register_page_pac');
                            } else if (_selPacMed[1]) {
                              Navigator.pushNamed(
                                  context, '/register_page_med');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 167, 73, 255)),
                          child: Text('Novo Usuário / Cadastrar',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/google-logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber[100],
                              border: Border.all(
                                  width: 5, color: Colors.amber.shade100)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.warning,
                              color: Colors.amber,
                            ),
                            iconSize: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Contato de\nEmergência",
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
