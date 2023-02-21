import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final emailController = TextEditingController();
   final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'password',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text('LOGIN'),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
