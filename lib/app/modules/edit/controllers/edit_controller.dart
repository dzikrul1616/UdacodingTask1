import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  //TODO: Implement EditController
  late TextEditingController product;
  late TextEditingController deskripsi;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('barang').doc(docID);
    return docRef.get();
  }

  void updatedata(String product, String deskripsi, String docID) async {
    DocumentReference docData = firestore.collection('barang').doc(docID);

    try {
      await docData.update({
        'product': product,
        'deskripsi': deskripsi,
      });

      Get.defaultDialog(
        title: 'Berhasil',
        middleText: 'Berhasil mengubah produk',
        onConfirm: () {
          Get.back();
          Get.back();
        },
        textConfirm: "Okay",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: 'Tidak berhasil mengubah data',
      );
    }
  }

  @override
  void onInit() {
    product = TextEditingController();
    deskripsi = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    product.dispose();
    deskripsi.dispose();
    super.onClose();
  }
}
