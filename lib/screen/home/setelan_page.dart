import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetelanScreen extends StatefulWidget {
  @override
  _SetelanScreenState createState() => _SetelanScreenState();
}

class _SetelanScreenState extends State<SetelanScreen> {
  bool isSwitched = true; // Variabel untuk menyimpan status switch

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
                '      Setelan',
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '    REKAMAN SUARA',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 69, 118, 108),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60, // Increased button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for button 1
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 137, 197, 169), // background color
                      disabledBackgroundColor: Colors.white, // foreground color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Set border radius
                      ),
                    ),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Tekan dua kali rekaman',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ),
                        ),
                        Spacer(), // Untuk memberi jarak di antara teks dan switch
                        Switch(
                          value: isSwitched,
                          onChanged: (newValue) {
                            setState(() {
                              isSwitched = newValue;
                              // Tambahkan logika ketika switch diubah
                            });
                          },
                          activeColor:
                              Colors.white, // Atur warna switch saat aktif
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10), // Add space between buttons
                SizedBox(
                  height: 60, // Increased button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for button 2
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 137, 197, 169), // background color
                      disabledBackgroundColor: Colors.white, // foreground color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Set border radius
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daftar rekaman',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '    TENTANG PERANGKAT',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 69, 118, 108),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                SizedBox(height: 10), // Add space between buttons
                SizedBox(
                  height: 60, // Increased button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for button 3
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 137, 197, 169), // background color
                      disabledBackgroundColor: Colors.white, // foreground color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Set border radius
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Versi',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Text(
                          'v0.0.1',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  '    AKUN',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 69, 118, 108),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                SizedBox(height: 10), // Add space between buttons
                SizedBox(
                  height: 60, // Increased button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Show logout confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Logout'),
                            content: Text('Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Logout'),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  // Add your logout functionality here
                                  await FirebaseAuth.instance.signOut();
                                  // Navigate to the login screen
                                  Navigator.pushReplacementNamed(
                                      context, '/');
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 137, 197, 169), // background color
                      disabledBackgroundColor: Colors.white, // foreground color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Set border radius
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Logout',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
