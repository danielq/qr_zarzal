import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_zarzal/providers/ui_providers.dart';

class CustomNavigationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProviders = Provider.of<UiProviders>(context);
    final currentIndex = uiProviders.selectedMenuOpt;
    return BottomNavigationBar(
        onTap: (int i) => uiProviders.selectedMenuOpt = i,
        currentIndex: currentIndex,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Direcciones')
        ]);
  }
}
