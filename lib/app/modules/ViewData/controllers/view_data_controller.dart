import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ViewDataController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference product = firestore.collection('barang');
    return product.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference product = firestore.collection('barang');
    return product.snapshots();
  }

  void deletedata(String docID) async {
    DocumentReference docData = firestore.collection('barang').doc(docID);

    try {
      Get.defaultDialog(
          title: 'Delete Product',
          middleText: 'Apakah yakin anda akan menghapus ini?',
          onConfirm: () async {
            await docData.delete();
            Get.back();
          },
          textConfirm: "Yes",
          textCancel: "No");
      ;
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: 'Tidak berhasil menghapus data',
      );
    }
  }
}
