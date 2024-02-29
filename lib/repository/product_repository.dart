import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("products");

  Future<void> create({required String name, required String measurement, required String price, required String qrcode}) async {
    try {
      await _fireCloud.add({"name": name, "measurement":measurement ,"price": price, "qrcode": qrcode});
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}