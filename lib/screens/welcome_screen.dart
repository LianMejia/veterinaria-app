import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: const Image(
            image: AssetImage('assets/image_welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 75,
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShowUpAnimation(
                  animationDuration: const Duration(milliseconds: 300),
                  delayStart: const Duration(milliseconds: 50),
                  curve: Curves.bounceIn,
                  child: const Text(
                    'VETERINARIA',
                    style: TextStyle(
                        letterSpacing: 0.7,
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ShowUpAnimation(
                  delayStart: const Duration(milliseconds: 1),
                  curve: Curves.bounceIn,
                  child: SizedBox(
                    width: size.width * 0.6,
                    child: const Text(
                      'Verifica, agenda y gestiona con facilidad la salud de tus mascotas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: Column(
            children: [
              ShowUpAnimation(
                delayStart: const Duration(milliseconds: 250),
                curve: Curves.bounceIn,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'LoginScreen');
                  },
                  child: const Text('Iniciar Sesion'),
                  color: Colors.white,
                  minWidth: size.width * 1,
                  height: 40,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ShowUpAnimation(
                delayStart: const Duration(milliseconds: 350),
                curve: Curves.bounceIn,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'RegisterScreen');
                  },
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
