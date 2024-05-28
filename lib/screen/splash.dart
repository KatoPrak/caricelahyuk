import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({Key? key, this.child}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Melakukan operasi yang diperlukan saat inisialisasi
    // Misalnya, menunggu beberapa saat dan kemudian pindah ke halaman berikutnya
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget
              .child!, // Ganti dengan halaman tujuan setelah splash screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/image/logo_cc.png', // Sesuaikan dengan path gambar logo Anda
              width: 600, // Sesuaikan dengan lebar yang diinginkan
              height: 600, // Sesuaikan dengan tinggi yang diinginkan
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Menampilkan indikator loading
          ],
        ),
      ),
    );
  }
}
