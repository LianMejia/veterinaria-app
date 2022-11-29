import 'dart:io';

import 'package:flutter/cupertino.dart';

class CreateNewPetProvider extends ChangeNotifier {
  String namePet = '';
  String yearsPet = '';
  String racePet = '';
  String typePet = '';
  File imagen = File('');
}
