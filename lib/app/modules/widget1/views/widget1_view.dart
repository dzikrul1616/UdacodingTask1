import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/widget1_controller.dart';

class Widget1View extends GetView<Widget1Controller> {
  const Widget1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: <Widget>[ 
        Expanded(
          child: Container(
            height: 100,
            color: Colors.red,
          ),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ],
    ));
  }
}
