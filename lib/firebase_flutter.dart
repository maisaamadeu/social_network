import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:social_network/utils/authentication.dart';

class FirebaseFlutter {
  void publish({
    required String? text,
    required File? img,
    required BuildContext context,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    if (_auth.currentUser == null)
      Authentication.signInWithGoogle(context: context);

    if (_auth.currentUser == null) return;
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
        'date': Timestamp.now(),
        'displayName': _auth.currentUser!.displayName,
        'uid': _auth.currentUser!.uid,
        'photoURL': _auth.currentUser!.photoURL,
      });
    } else if (text != null && img == null) {
      await pubs.doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
        'text': text,
        'date': Timestamp.now(),
        'displayName': _auth.currentUser!.displayName,
        'uid': _auth.currentUser!.uid,
        'photoURL': _auth.currentUser!.photoURL,
      });
    } else if (img != null && text == null) {
      await pubs.doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
        'img': url,
        'date': Timestamp.now(),
        'displayName': _auth.currentUser!.displayName,
        'uid': _auth.currentUser!.uid,
        'photoURL': _auth.currentUser!.photoURL,
      });
    }
  }
}
