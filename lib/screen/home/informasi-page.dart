import 'package:cari_celah/screen/home/riwayat-lokasi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 137, 197, 169),
        titleSpacing: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '      Informasi',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/image/informasi.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 190,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 220, 211, 184),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'www.example.com',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
