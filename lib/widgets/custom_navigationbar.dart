import 'package:flutter/material.dart';

class CustomNavigationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
      BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration), label: 'Direcciones')
    ]);
  }
}
