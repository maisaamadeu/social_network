import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseFlutter {
  void publish({
    required String? text,
    required File? img,
    required BuildContext context,
  }) async {
    final CollectionReference pubs =
        FirebaseFirestore.instance.collection('pubs');
    late String url;

    if (img != null) {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().microsecondsSinceEpoch.toString())
          .putFile(img);

      TaskSnapshot taskSnapshot = await uploadTask;
      url = await taskSnapshot.ref.getDownloadURL();
    }

    if (text != null && img != null) {
      await pubs.doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
        'text': text,
        'img': url,
      });
    } else if (text != null && img == null) {
      await pubs.doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
        'text': text,
      });
    } else if (img != null && text == null) {
      await pubs.doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
        'img': url,
      });
    }
  }
}
