import 'package:flutter/material.dart';

import 'new_pet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Inicio',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPet()),
                );
              },
              child: Container(
                /* padding: EdgeInsets.all(2), */
                decoration: BoxDecoration(
                    color: Colors.teal, borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: size.height * 0.25,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Registre a su mascota',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.pets,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                ),
                /* child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8)),
                width: size.width,
                height: size.height,
              ), */
              ),
            )
          ],
        ));
  }
}
