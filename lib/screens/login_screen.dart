import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoignScreen extends StatefulWidget {
  const LoignScreen({Key? key}) : super(key: key);

  @override
  State<LoignScreen> createState() => _LoignScreenState();
}

class _LoignScreenState extends State<LoignScreen> {
  TextEditingController _emailController = TextEditingController();

  bool isButtonActive = false;

  TextEditingController _passwordController = TextEditingController();

  bool isButtonActive2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.addListener(() {
      final isButtonActive = _emailController.text.length >= 6;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    _passwordController.addListener(() {
      final isButtonActive2 = _passwordController.text.length >= 8;
      setState(() {
        this.isButtonActive2 = isButtonActive2;
      });
    });
  }

  bool _ocultPass = true;

  Icon _iconPass = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
            tooltip: 'Regresar',
          ),
          /* title: const Text(
            'Iniciar Sesion',
            style: TextStyle(color: Colors.black),
          ), */
          elevation: 0),
      body: SizedBox(
        width: size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Iniciar Sesion',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Ingresa y empieza a cuidar la',
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'salud de tus mascotass',
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                      labelStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(),
                      label: Text(
                        'Correo Electronico',
                        style: TextStyle(color: Colors.grey),
                      ),
                      isDense: true),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                      labelStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      label: Text(
                        'Contraseña',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      isDense: true),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              MaterialButton(
                elevation: 0,
                height: 40,
                color: Colors.teal,
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);
                    FirebaseAuth.instance
                        .authStateChanges()
                        .listen((User? user) async {
                      if (user == null) {
                        print('Error');
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'No esta registrado, por favor registrese')));
                      } else {
                        final logueado = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);

                        final tokenResult =
                            await FirebaseAuth.instance.currentUser!;
                        final idToken = await tokenResult.getIdToken();
                        final token = idToken;
                        print(token);

                        await storage.write(key: 'token', value: token);

                        Navigator.pushNamed(context, 'PrincipalBnb');
                      }
                    });
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'No esta registrado, por favor cree una cuenta')));
                  }
                },
                child: const Text(
                  'Iniciar Sesion',
                  style: TextStyle(color: Colors.white),
                ),
                minWidth: size.width * 0.9,
                shape: StadiumBorder(),
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
