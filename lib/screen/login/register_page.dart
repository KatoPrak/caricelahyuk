import 'package:cari_celah/screen/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class FirebaseAuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(String username, String email, String password) async {
    try {
      // Hash the password before storing it
      var bytes = utf8.encode(password);
      var digest = sha1.convert(bytes);
      var hashedPassword = digest.toString();

      // Create user in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user details in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
        'password': hashedPassword, // Store the hashed password in Firestore
      });
    } catch (e) {
      print('Error adding user: $e');
      throw e;
    }
  }
}

class User {
  final String username;
  final String email;
  final String password;

  User({required this.username, required this.email, required this.password});
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AplikasiSaya());
}

class AplikasiSaya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterForm(),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size ukuranLayar = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ukuranLayar.height,
          width: ukuranLayar.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/image/bg3.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: FormulirDaftar(),
            ),
          ),
        ),
      ),
    );
  }
}

class FormulirDaftar extends StatefulWidget {
  @override
  _FormulirDaftarState createState() => _FormulirDaftarState();
}

class _FormulirDaftarState extends State<FormulirDaftar> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 220, 211, 184),
            ),
            margin: EdgeInsets.only(
              bottom: 0,
              top: 10,
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              'Daftar',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 244, 244),
              border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna',
                    prefixIcon: Icon(Icons.person),
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                  style: TextStyle(fontSize: 15),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Masukkan nama pengguna Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Masukkan email Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isPasswordObscure,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    prefixIcon: Icon(Icons.lock),
                    labelStyle: TextStyle(fontSize: 14),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Masukkan kata sandi Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _isConfirmPasswordObscure,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Kata Sandi',
                    prefixIcon: Icon(Icons.lock),
                    labelStyle: TextStyle(fontSize: 14),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordObscure =
                              !_isConfirmPasswordObscure;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Konfirmasi kata sandi Anda';
                    } else if (value != _passwordController.text) {
                      return 'Kata sandi tidak cocok';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(25, 45)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 220, 211, 184),
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await _auth.registerUser(
                          _usernameController.text,
                          _emailController.text,
                          _passwordController
                              .text, // Tambahkan kata sandi sebagai parameter
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Pengguna berhasil terdaftar')),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Terjadi kesalahan: $e')),
                        );
                      }
                    }
                  },
                  child: Text(
                    'Daftar',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sudah memiliki akun? ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 172, 209, 191),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Klik disini',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color.fromARGB(255, 123, 183, 155),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
