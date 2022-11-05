import 'package:flutter/cupertino.dart';
import 'package:veterinaria_app/screens/login_screen.dart';
import 'package:veterinaria_app/screens/welcome_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    'WelcomeScreen': (BuildContext context) => const WelcomeScreen(),
    'LoginScreen': (BuildContext context) => const LoignScreen(),
  };
}
