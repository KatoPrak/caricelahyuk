import 'package:cari_celah/configurate/network_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:http/http.dart' as http; // Tambahkan http untuk dapat menggunakan http.get
import 'package:cari_celah/screen/home/pengaturan_alat.dart';

// Ekstensi untuk capitalize
extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + this.substring(1);
  }
}

class DashboardScreen extends StatefulWidget {
  final String baseUrl = 'http://YOUR_DEVICE_IP'; // Ganti YOUR_DEVICE_IP dengan IP perangkat Anda

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String username = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          username = userData['username'];
          email = userData['email'];
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> _connectToWiFi(String ssid, String password) async {
    try {
      bool isConnected = await WiFiForIoTPlugin.connect(ssid,
          password: password, security: NetworkSecurity.WPA);
      if (isConnected) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terhubung ke $ssid')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal terhubung ke $ssid')),
        );
      }
    } catch (e) {
      print('Error connecting to WiFi: $e');
    }
  }

  void _controlBuzzer(String command) async {
    final url = Uri.parse('${widget.baseUrl}/buzzer/$command'); // Mengakses baseUrl dari objek widget
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('Buzzer $command successfully');
    } else {
      print('Failed to control buzzer');
    }
  }

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 137, 197, 169),
        leading: IconButton(
          icon: Icon(
            Icons.person,
            size: 48,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username.capitalize(),
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            Text(
              email.capitalize(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Image.asset(
                'lib/image/logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(25, 45)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 69, 118, 108),
                    ),
                    elevation: MaterialStateProperty.all<double>(7),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddDevicePage()),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tambah Perangkat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: containerWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      image: DecorationImage(
                        image: AssetImage('lib/image/tas.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PengaturanAlatScreen()),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.12,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 69, 118, 108),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              '  Perangkat 1',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () => _controlBuzzer('on'),
                            child: Text('Bunyikan'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: Text('Terkoneksi'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
