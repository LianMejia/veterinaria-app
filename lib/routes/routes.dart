import 'package:flutter/cupertino.dart';
import 'package:veterinaria_app/screens/check_auth_screen.dart';
import 'package:veterinaria_app/screens/login_screen.dart';
import 'package:veterinaria_app/screens/new_pet.dart';
import 'package:veterinaria_app/screens/principal_bnb.dart';
import 'package:veterinaria_app/screens/register_screen.dart';
import 'package:veterinaria_app/screens/welcome_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const WelcomeScreen(),
    'LoginScreen': (BuildContext context) => const LoignScreen(),
    'RegisterScreen': (BuildContext context) => const RegisterScreen(),
    'PrincipalBnb': (BuildContext context) => PrincipalBnb(),
    'NewPet': (BuildContext context) => const NewPet(),
    'CheckAuthScreen': (BuildContext context) => CheckAuthScreen(),
  };
}
