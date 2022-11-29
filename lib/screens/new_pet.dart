import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:veterinaria_app/screens/principal_bnb.dart';
import 'package:veterinaria_app/services/create_new_pet_provider.dart';

class NewPet extends StatelessWidget {
  const NewPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          elevation: 0,
          backgroundColor: Colors.teal,
          title: const Text(
            'Registrar nueva mascota',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [const ImagePet(), FormPet()],
        ),
      ),
    );
  }
}

class FormPet extends StatefulWidget {
  @override
  State<FormPet> createState() => _FormPetState();
}

class _FormPetState extends State<FormPet> {
  String dropdownvalue = 'Perro';

  // List of items in our dropdown menu
  var items = [
    'Perro',
    'Gato',
    'Pajaro',
  ];

  TextEditingController _petType = TextEditingController();

  bool isButtonActive = false;

  TextEditingController _petRace = TextEditingController();

  bool isButtonActive2 = false;

  TextEditingController _namePet = TextEditingController();

  bool isButtonActive3 = false;

  TextEditingController _petYears = TextEditingController();

  bool isButtonActive4 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _petType.addListener(() {
      final isButtonActive = _petType.text.length != '';
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });

    _petRace.addListener(() {
      final isButtonActive2 = _petRace.text.length != '';
      setState(() {
        this.isButtonActive2 = isButtonActive2;
      });
    });

    _namePet.addListener(() {
      final isButtonActive3 = _namePet.text.length != '';
      setState(() {
        this.isButtonActive3 = isButtonActive3;
      });
    });

    _petYears.addListener(() {
      final isButtonActive4 = _petYears.text.length != '';
      setState(() {
        this.isButtonActive4 = isButtonActive4;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final variablesProviderNewPet = Provider.of<CreateNewPetProvider>(context);
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 400),
            child: const Text(
              '¿Cual es su tipo de mascota?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 13),
            ),
          ),
          ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 400),
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 24),
              child: DropdownButtonFormField2(
                decoration: const InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Seleccione',
                  style: TextStyle(fontSize: 12),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    variablesProviderNewPet.typePet = newValue;
                  });
                },
              ),
            ),
          ),
          ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 500),
            child: const Text(
              '¿De que raza es su mascota?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 13),
            ),
          ),
          ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 500),
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 24),
              child: DropdownButtonFormField2(
                decoration: const InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Seleccione',
                  style: TextStyle(fontSize: 12),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    variablesProviderNewPet.racePet = newValue;
                  });
                },
              ),
            ),
          ),
          ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 600),
            child: const Text(
              '¿Cual es el nombre de su mascota?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 13),
            ),
          ),
          ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 600),
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 24),
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                onChanged: (value) => variablesProviderNewPet.namePet = value,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(),
                    isDense: true),
              ),
              /* child: TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                ),
              ), */
            ),
          ),
          ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 700),
            child: const Text(
              '¿Cuantos años tiene su mascota?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 13),
            ),
          ),
          ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 700),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                onChanged: (value) => variablesProviderNewPet.yearsPet = value,
                controller: _petYears,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(),
                    isDense: true),
              ),
              /* TextFormField(
                maxLength: 3,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  counterText: "",
                  /* focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ), */
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  /* border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                  ), */
                ),
              ), */
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ShowUpAnimation(
              animationDuration: const Duration(milliseconds: 800),
              child: Column(
                children: [
                  if (variablesProviderNewPet.yearsPet != '' &&
                      variablesProviderNewPet.namePet != '' &&
                      variablesProviderNewPet.racePet != '' &&
                      variablesProviderNewPet.typePet != '' &&
                      variablesProviderNewPet.imagen.path.isNotEmpty) ...[
                    MaterialButton(
                      height: 40,
                      onPressed: () async {
                        /* print('Ok');
                        print(user!.uid);
                        print(variablesProviderNewPet.namePet);
                        print(variablesProviderNewPet.yearsPet);
                        print(variablesProviderNewPet.racePet);
                        print(variablesProviderNewPet.typePet);
                        print(variablesProviderNewPet.imagen);

                        final Reference = user.uid;

                        final snapshot = await FirebaseStorage.instance
                            .ref()
                            .child(
                                'usuarios/$Reference/${variablesProviderNewPet.namePet.toUpperCase()}/photo_pet')
                            .putFile(variablesProviderNewPet.imagen);

                        final downloadURL = await snapshot.ref.getDownloadURL();

                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .collection('pets')
                            .doc(variablesProviderNewPet.namePet.toUpperCase())
                            .set({
                          'nombre':
                              variablesProviderNewPet.namePet.toUpperCase(),
                          'edad': variablesProviderNewPet.yearsPet,
                          'tipo': variablesProviderNewPet.typePet.toUpperCase(),
                          'raza': variablesProviderNewPet.racePet.toUpperCase(),
                          'foto': downloadURL,
                        }); */

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                title: Text(
                                    '¿Esta seguro de registrar a ${variablesProviderNewPet.namePet} como nueva mascota?',
                                    style: TextStyle(fontSize: 18),
                                    textAlign: TextAlign.center),
                                actions: [
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MaterialButton(
                                          shape: const StadiumBorder(),
                                          onPressed: () async {
                                            print('Ok');
                                            print(user!.uid);
                                            print(variablesProviderNewPet
                                                .namePet);
                                            print(variablesProviderNewPet
                                                .yearsPet);
                                            print(variablesProviderNewPet
                                                .racePet);
                                            print(variablesProviderNewPet
                                                .typePet);
                                            print(
                                                variablesProviderNewPet.imagen);

                                            final Reference = user.uid;

                                            final snapshot = await FirebaseStorage
                                                .instance
                                                .ref()
                                                .child(
                                                    'usuarios/$Reference/${variablesProviderNewPet.namePet.toUpperCase()}/photo_pet')
                                                .putFile(variablesProviderNewPet
                                                    .imagen);

                                            final downloadURL = await snapshot
                                                .ref
                                                .getDownloadURL();

                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(user.uid)
                                                .collection('pets')
                                                .doc(variablesProviderNewPet
                                                    .namePet
                                                    .toUpperCase())
                                                .set({
                                              'nombre': variablesProviderNewPet
                                                  .namePet
                                                  .toUpperCase(),
                                              'edad': variablesProviderNewPet
                                                  .yearsPet,
                                              'tipo': variablesProviderNewPet
                                                  .typePet
                                                  .toUpperCase(),
                                              'raza': variablesProviderNewPet
                                                  .racePet
                                                  .toUpperCase(),
                                              'foto': downloadURL,
                                            });

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PrincipalBnb()),
                                            );
                                          },
                                          child: const Text(
                                            'Registrar',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          height: 18,
                                          child: VerticalDivider(
                                            color: Colors.black,
                                          ),
                                        ),
                                        MaterialButton(
                                          shape: const StadiumBorder(),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Regresar',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                        /* TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Salir',
                                              style: TextStyle(color: Colors.red),
                                            )),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text('Cancelar')) */
                                      ],
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      child: Text(
                        'Registrar mascota',
                        style: TextStyle(color: Colors.white),
                      ),
                      minWidth: double.infinity,
                      shape: const StadiumBorder(),
                      color: Colors.teal,
                    ),
                  ] else ...[
                    MaterialButton(
                      height: 40,
                      onPressed: () {},
                      child: Text(
                        'Registrar mascota',
                        style: TextStyle(color: Colors.white),
                      ),
                      minWidth: double.infinity,
                      shape: const StadiumBorder(),
                      color: Colors.grey,
                    ),
                  ]
                ],
              ))
        ],
      ),
    );
  }
}

class ImagePet extends StatefulWidget {
  const ImagePet({
    Key? key,
  }) : super(key: key);

  @override
  State<ImagePet> createState() => _ImagePetState();
}

class _ImagePetState extends State<ImagePet> {
  String pictureURL = '';

  File _pickedImage = File('');
  bool _isLoading = false;

  String Reference = '';

  String? url = '';

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 600,
      maxWidth: 600,
    );
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });

    /* Navigator.pop(context); */
  }

  @override
  Widget build(BuildContext context) {
    final variablesProviderNewPet = Provider.of<CreateNewPetProvider>(context);
    variablesProviderNewPet.imagen = File(_pickedImage.path);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      padding: const EdgeInsets.only(top: 10, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              ShowUpAnimation(
                animationDuration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
                child: const Text(
                  'Imagen de su mascota',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              ShowUpAnimation(
                animationDuration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
                child: MaterialButton(
                    onPressed: _pickImageGallery,
                    child: Text(
                      'Seleccionar Imagen',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    height: 30,
                    minWidth: 100,
                    shape: const StadiumBorder(),
                    color: Colors.white.withOpacity(0.4)),
              )
            ],
          ),
          if (_pickedImage == null)
            ShowUpAnimation(
              animationDuration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
              ),
            )
          else ...[
            ShowUpAnimation(
              animationDuration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                    height: 120,
                    width: 120,
                    /* margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10), */
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(_pickedImage)))),
              ),
            ),
            /* ClipRRect(
              child: Container(
                  height: 300,
                  width: 400,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: FileImage(_pickedImage!)))),
            ), */
          ]
          /* ShowUpAnimation(
            animationDuration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ) */
        ],
      ),
    );
  }
}
