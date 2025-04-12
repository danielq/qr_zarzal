import 'package:flutter/material.dart';
import 'package:qr_zarzal/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner and Maps',
      initialRoute: 'home',
      routes: {'home': (_) => HoemPage(), 'mapa': (_) => MapaPage()},
    );
  }
}
