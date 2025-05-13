import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_zarzal/models/scan_model.dart';
import 'package:qr_zarzal/pages/pages.dart';
import 'package:qr_zarzal/providers/db_provider.dart';
import 'package:qr_zarzal/providers/ui_providers.dart';
import 'package:qr_zarzal/widgets/widgets.dart';

class HoemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: Text('Historial'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationbar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // cambiar para mostrar la pagina respectiva
    final uiProviders = Provider.of<UiProviders>(context);
    final currentIndex = uiProviders.selectedMenuOpt;
    // TODO: Temporal para leer la base de datos
    // DbProvider.db.database;
    final tempScan = ScanModel(valor: 'http://www.wwe.com');
    DbProvider.db.nuevoScan(tempScan);
    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
