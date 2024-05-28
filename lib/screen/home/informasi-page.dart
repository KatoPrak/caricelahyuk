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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Image.asset(
              'lib/image/informasi.png',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
