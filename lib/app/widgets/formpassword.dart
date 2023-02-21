
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPassword extends StatelessWidget {
  const FormPassword({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}