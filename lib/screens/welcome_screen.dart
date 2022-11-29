import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 8, top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_q3mlcaak.json',
                      repeat: false),
                  const SizedBox(
                    height: 40,
                  ),
                  ShowUpAnimation(
                    animationDuration: const Duration(milliseconds: 300),
                    delayStart: const Duration(milliseconds: 50),
                    curve: Curves.bounceIn,
                    child: const Text(
                      'VETERINARIA',
                      style: TextStyle(
                          letterSpacing: 0.7,
                          fontSize: 46,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
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
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.only(top: 20, bottom: 22),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 250),
                    curve: Curves.bounceIn,
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.pushNamed(context, 'LoginScreen');
                      },
                      child: const Text(
                        'Iniciar Sesion',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      color: Colors.white,
                      minWidth: size.width * 0.5,
                      height: 40,
                      shape: StadiumBorder(),
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
                        'Crear una cuenta',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
