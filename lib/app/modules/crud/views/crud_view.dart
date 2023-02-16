// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/app/modules/ViewData/views/view_data_view.dart';
import 'package:crud/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/crud_controller.dart';

class CrudView extends StatefulWidget {
  const CrudView({Key? key}) : super(key: key);

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {
  final productController = TextEditingController();
  final deskripsiController = TextEditingController();
  bool _validateProduct = false;
  bool _validatedeskripsi = false;

  deletedata(id) async {
    await FirebaseFirestore.instance.collection('barang').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference product = firestore.collection('barang');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Create Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: productController,
              maxLength: 15,
              decoration: InputDecoration(
                labelText: 'Product',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                suffixIcon: Icon(
                  Icons.production_quantity_limits,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: deskripsiController,
              maxLength: 30,
              decoration: InputDecoration(
                labelText: 'deskripsi',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                suffixIcon: Icon(
                  Icons.money,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  product.add({
                    'Tanggal': DateFormat('dd-MM-yyyy KK:mm:ss a')
                        .format(DateTime.now()),
                    'product': productController.text,
                    'deskripsi': deskripsiController.text
                  });

                  productController.text = '';
                  deskripsiController.text = '';
                  // dengan navigasi kearah barang view
                  Get.to(() => ViewDataView(),
                      transition: Transition.circularReveal,
                      duration: Duration(seconds: 2));
                },
                child: Container(
                  width: 400,
                  height: 50,
                  child: Center(child: Text('Add Data')),
                )),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an data?'),
                InkWell(
                  onTap: () {
                    Get.to(() => ViewDataView(),
                        transition: Transition.circularReveal,
                        duration: Duration(seconds: 2));
                  },
                  child: Text(
                    ' View Data',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      )),
    );
  }
}
