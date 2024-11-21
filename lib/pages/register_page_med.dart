import 'package:flutter/material.dart';

class RegisterPageMed extends StatefulWidget {
  const RegisterPageMed({super.key});

  @override
  State<RegisterPageMed> createState() => _RegisterPageMedState();
}

class _RegisterPageMedState extends State<RegisterPageMed> {
  bool _acTermos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registro de médico",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Registro de médico:", style: TextStyle(fontSize: 16)),
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
          ]),
        ),
      ),
    );
  }
}
