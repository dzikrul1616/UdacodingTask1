import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          TextFormField(
            initialValue: 'admin@gmail.com',
            maxLength: 20,
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.blueGrey,
              ),
              suffixIcon: Icon(
                Icons.email,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
              helperText: 'Enter your email address',
            ),
            onChanged: (value) {},
          ),
        ],
      )),
    );
  }
}
