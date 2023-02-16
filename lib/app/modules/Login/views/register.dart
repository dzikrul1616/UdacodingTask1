import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/app/modules/Login/views/login_view.dart';
import 'package:crud/app/constant/colors.dart';
import 'package:crud/app/modules/home/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final motoController = TextEditingController();
  final passwordController = TextEditingController();
  String? _selectedAgama;
  String? _selectedGender;
  final List<String> _agamaList = [
    'Islam',
    'Kristen',
    'Katolik',
    'Buddha',
    'Hindu'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Registration Form',
                style: TextStyle(
                  color: appPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  controller: motoController,
                  decoration: const InputDecoration(
                    labelText: 'Moto Hidup',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    prefixIcon: Icon(
                      Icons.book,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              RadioListTile<String>(
                title: Text('Laki-laki'),
                value: 'Laki-laki',
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Perempuan'),
                value: 'Perempuan',
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Agama',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedAgama,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedAgama = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  items: _agamaList
                      .map((agama) => DropdownMenuItem<String>(
                            value: agama,
                            child: Text(agama),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah punya akun?'),
                  const SizedBox(
                    width: 2.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginView(),
                          transition: Transition.cupertino,
                          duration: Duration(seconds: 1));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Color(0xff0000ff)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      final FirebaseAuth _auth = FirebaseAuth.instance;
                      final FirebaseFirestore firestore =
                          FirebaseFirestore.instance;

                      final String? moto = motoController.text;
                      final String? agama = _selectedAgama;
                      final String? email = emailController.text;
                      final String password = passwordController.text;
                      final String? gender = _selectedGender;

                      if (moto != null &&
                          agama != null &&
                          email != null &&
                          gender! != null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          barrierDismissible: false,
                        );
                        try {
                          UserCredential userCredential =
                              await _auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          String userId = userCredential.user!.uid;
                          await firestore.collection('users').doc(userId).set({
                            'moto': moto,
                            'agama': agama,
                            'email': email,
                            'gender': gender,
                          });
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeView()),
                          );
                        } catch (error) {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Failed to save data: $error'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(primary: appPrimary),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final String? moto = motoController.text;
                      final String? agama = _selectedAgama;
                      final String? email = emailController.text;
                      final String? password = passwordController.text;
                      final String? gender = _selectedGender;

                      if (moto != null &&
                          agama != null &&
                          email != null &&
                          gender != null &&
                          password != null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                  child: Center(child: Text('Hasil Input'))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Moto: $moto'),
                                  Text('Agama: $agama'),
                                  Text('Email: $email'),
                                  Text('Password: $password'),
                                  Text('Gender: $gender'),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  child: Center(child: Text('Tutup')),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        print('Form data tidak lengkap');
                      }
                    },
                    child: Center(
                      child: Text('Pop Up'),
                    ),
                    style: ElevatedButton.styleFrom(primary: appGreen),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
