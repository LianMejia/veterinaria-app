import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:veterinaria_app/screens/principal_bnb.dart';
import 'package:veterinaria_app/screens/welcome_screen.dart';
import 'package:veterinaria_app/services/secure_token_login.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<SecureTokenLogin>(context, listen: false);
    final storage = FlutterSecureStorage();
    Future<String> readToken() async {
      //Si no existe el token
      return await storage.read(key: 'token') ?? '';
    }

    return Scaffold(
      body: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //Si no se tiene la data(token)construimos
            //este widget
            if (!snapshot.hasData) {
              return const SizedBox();
            }

            //Un widget primero debe construirse antes de
            //poder hacer una navegacion

            //Esta funcion se ejecutara tan pronto esta
            //pantala se construya

            //Si no tengo la data(token), es decir
            //si retorna un string vacio
            if (snapshot.data == '') {
              Future.microtask(() {
                /* Navigator.pushReplacementNamed(context, 'homeScreen'); */
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => WelcomeScreen(),
                        transitionDuration: const Duration(seconds: 0)));
              });
              //Si se tiene la data(token) y retorna el token
            } else {
              Future.microtask(() {
                /* Navigator.pushReplacementNamed(context, 'homeScreen'); */
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => PrincipalBnb(),
                        transitionDuration: const Duration(seconds: 0)));
              });
            }

            return Container();
          }),
    );
  }
}
