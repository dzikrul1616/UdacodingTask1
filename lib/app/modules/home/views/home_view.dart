import 'package:crud/app/modules/Login/views/login_view.dart';
import 'package:crud/app/modules/api/views/api_view.dart';
import 'package:crud/app/modules/widget1/views/widget2.dart';
import 'package:crud/app/modules/widget1/views/widget4.dart';
import 'package:crud/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 40),
          const SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              final provider = FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginView()));
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "CRUD (Create, Read, Update, Delete) Product with deskripsi",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.CRUD),
                child: Text('Add Product')),
          ),
          Container(
            width: 200,
            child: ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.VIEW_DATA),
                child: Text('View Product')),
          ),
          Container(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CounterDisplay()));
                },
                child: Text('Screen 2')),
          ),
          Container(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ApiView()));
                },
                child: Text('Api Screen')),
          ),
          // Container(
          //   width: 200,
          //   child: ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => widget4()));
          //       },
          //       child: Text('Screen 4')),
          // ),
        ],
      ),
    ));
  }
}
