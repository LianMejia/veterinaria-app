import 'dart:ui';

import 'package:flutter/material.dart';

class LoignScreen extends StatelessWidget {
  const LoignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'WelcomeScreen');
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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      label: Text('Correo Electronico'),
                      isDense: true),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      label: Text('Contraseña'),
                      isDense: true),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              MaterialButton(
                height: 40,
                color: Colors.grey[200],
                onPressed: () {},
                child: const Text('Iniciar Sesion'),
                minWidth: size.width * 0.9,
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
