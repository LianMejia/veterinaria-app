import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenLogin with ChangeNotifier {
  final storage = FlutterSecureStorage();
  //Metodo para leer el token(si existe) del firebase storage
  Future<String> readToken() async {
    //Si no existe el token
    return await storage.read(key: 'token') ?? '';
  }
}
