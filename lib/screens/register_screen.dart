import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();

  bool isButtonActive = false;

  TextEditingController _passwordController = TextEditingController();

  bool isButtonActive2 = false;

  TextEditingController _nameController = TextEditingController();

  bool isButtonActive3 = false;

  TextEditingController _phoneController = TextEditingController();

  bool isButtonActive4 = false;

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
    _nameController.addListener(() {
      final isButtonActive3 = _nameController.text.length >= 4;
      setState(() {
        this.isButtonActive3 = isButtonActive3;
      });
    });
    _phoneController.addListener(() {
      final isButtonActive4 = _phoneController.text.length == 10;
      setState(() {
        this.isButtonActive4 = isButtonActive4;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                'Registrarse',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Crea una cuenta y mantente',
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'al dia de la salud de tus mascotas',
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: TextFormField(
                  controller: _nameController,
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
                        'Nombres',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
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
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
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
                        'Celular',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      isDense: true,
                      counterText: ""),
                ),
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
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      label: Text(
                        'Correo Electronico',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
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
                  obscureText: true,
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
              Column(
                children: [
                  if (isButtonActive &&
                      isButtonActive2 &&
                      isButtonActive3 &&
                      isButtonActive4) ...[
                    MaterialButton(
                      elevation: 0,
                      shape: StadiumBorder(),
                      height: 40,
                      color: Colors.green[600],
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .where('email', isEqualTo: _emailController.text)
                            .get()
                            .then((value) async {
                          if (value.docs.isEmpty) {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text);

                              FirebaseAuth.instance
                                  .authStateChanges()
                                  .listen((User? user) async {
                                if (user == null) {
                                  print('User is currently signed out!');
                                } else {
                                  print('Usuario Logueado!');
                                  print(user.uid);
                                  FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(user.uid)
                                      .set({
                                    'uid': user.uid,
                                    'email': _emailController.text,
                                    'password': _passwordController.text,
                                    'names': _nameController.text.toUpperCase(),
                                    'phone': _phoneController.text
                                  });
                                  /* await user.sendEmailVerification(); */
                                  /* Navigator.pushNamed(
                                      context, 'registerSuccess'); */
                                }
                              });
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'El correo electronico que ingreso ya se encuentra registrado')));
                          }
                        });
                        /* try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);

                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User? user) {
                          if (user == null) {
                            print('User is currently signed out!');
                          } else {
                            print('Usuario Logueado!');
                            print(user.uid);
                            FirebaseFirestore.instance
                                .collection("usuarios")
                                .doc(user.uid)
                                .set({
                              'uid': user.uid,
                              'email': _emailController.text,
                              'password': _passwordController.text,
                              'nombres': widget.nombres,
                              'apellidos': widget.apellidos,
                              'celular': widget.celular
                            });
                            Navigator.pushNamed(context, 'registerSuccess');
                          }
                        });
                      } catch (e) {
                        print(e);
                      } */
                      },
                      child: const Text(
                        'Crear Cuenta',
                        style: TextStyle(color: Colors.white),
                      ),
                      minWidth: size.width * 0.9,
                    ),
                  ] else ...[
                    MaterialButton(
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      height: 40,
                      color: Colors.grey[400],
                      onPressed: () {},
                      child: const Text(
                        'Crear Cuenta',
                        style: TextStyle(color: Colors.white),
                      ),
                      minWidth: size.width * 0.9,
                      shape: const StadiumBorder(),
                    ),
                  ]
                ],
              )
            ]),
      ),
    );
  }
}
