import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_zarzal/pages/pages.dart';
import 'package:qr_zarzal/providers/ui_providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProviders())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner and Maps',
        initialRoute: 'home',
        routes: {'home': (_) => HoemPage(), 'mapa': (_) => MapaPage()},
        theme: ThemeData(
            primaryColor: Colors.redAccent,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.redAccent)),
      ),
    );
  }
}
