// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hcpa/pages/login_page.dart';
import 'package:hcpa/pages/pac_dashboard.dart';
import 'package:hcpa/pages/register_page_med.dart';
import 'package:hcpa/pages/register_page_pac.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Saúde Digital',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/login_page': (context) => LoginPage(),
        '/register_page_pac': (context) => RegisterPagePac(),
        '/register_page_med': (context) => RegisterPageMed(),
        '/pac_dashboard': (context) => PacDashboard()
      },
      home: LoginPage(),
    );
  }
}
