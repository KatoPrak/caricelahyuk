import 'package:cari_celah/screen/home/dashboard.dart';
import 'package:cari_celah/screen/home/informasi-page.dart';
import 'package:cari_celah/screen/home/peta_page.dart';
import 'package:cari_celah/screen/home/setelan_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    PetaScreen(),
    InformasiScreen(),
    SetelanScreen(),
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 137, 197, 169),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 137, 197, 169),
            icon: Icon(Icons.device_hub),
            label: 'Perangkat',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 137, 197, 169),
            icon: Icon(Icons.history),
            label: 'Lokasi',
          ),
            BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 137, 197, 169),
            icon: Icon(Icons.info),
            label: 'Informasi',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 137, 197, 169),
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        showSelectedLabels: true, // Menampilkan label untuk item yang dipilih
        showUnselectedLabels:
            true, // Menampilkan label untuk item yang tidak dipilih
        onTap: _onItemTapped,
      ),
    );
  }
}
