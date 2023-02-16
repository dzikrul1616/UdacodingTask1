import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/app/modules/edit/views/edit_view.dart';
import 'package:crud/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
// import 'dart:html';
import 'package:get/get.dart';

import '../controllers/view_data_controller.dart';

class ViewDataView extends GetView<ViewDataController> {
  ViewDataView({Key? key}) : super(key: key);

  deletedata(id) async {
    await FirebaseFirestore.instance.collection('barang').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewDataView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          // stream untuk menampilkan data yang sudah diinput dan dipanggil dari firestore menggunakan firebase_storage
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('barang').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  var listAllDocs = snapshot.data!.docs;
                  //list builder untuk membuat widget sesuai data yang telah di input
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            child: Center(
                              // data akan ditampilkan dalam bentuk sejajar dan dipanggil sesuai isi collection 'barang'
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 80,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 6, 238, 255),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['product'],
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3.0,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['deskripsi'],
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3.0,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['Tanggal'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () => Get.toNamed(
                                          Routes.EDIT,
                                          arguments: listAllDocs[index].id,
                                        ),
                                        icon: Icon(Icons.edit),
                                        iconSize: 20,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          deletedata(
                                              snapshot.data!.docs[index].id);
                                        },
                                        icon: Icon(Icons.delete),
                                        iconSize: 20,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.offAllNamed(Routes.CRUD),
        child: Icon(Icons.add),
      ),
    );
  }
}
