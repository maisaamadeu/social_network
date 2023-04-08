import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../firebase_flutter.dart';

class CreatePubScreen extends StatefulWidget {
  const CreatePubScreen({
    super.key,
  });

  @override
  State<CreatePubScreen> createState() => _CreatePubScreenState();
}

class _CreatePubScreenState extends State<CreatePubScreen> {
  File? _image;
  bool isEmpty = false;

  Future<void> _takePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _choosePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Publicação'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          children: [
            TextField(
              maxLines: null,
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Texto'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _takePicture();
                  },
                  child: const Text('Tirar foto'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    _choosePicture();
                  },
                  child: const Text('Escolher imagem'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (_image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(_image!),
              ),
            ElevatedButton(
              onPressed: () async {
                if (textController.text != '' &&
                    textController.text != null &&
                    _image != null) {
                  FirebaseFlutter().publish(
                    text:
                        textController.text != null || textController.text != ''
                            ? textController.text
                            : null,
                    img: _image != null ? _image : null,
                    context: context,
                  );
                  Navigator.pop(context);
                } else if (textController.text != '' &&
                    textController.text != null) {
                  FirebaseFlutter().publish(
                    text:
                        textController.text != null || textController.text != ''
                            ? textController.text
                            : null,
                    img: _image != null ? _image : null,
                    context: context,
                  );
                  Navigator.pop(context);
                } else if (_image != null) {
                  FirebaseFlutter().publish(
                    text:
                        textController.text != null || textController.text != ''
                            ? textController.text
                            : null,
                    img: _image != null ? _image : null,
                    context: context,
                  );
                  Navigator.pop(context);
                } else {
                  setState(() {
                    isEmpty = true;
                  });
                }
              },
              child: const Text('Publicar'),
            ),
            isEmpty
                ? const Center(
                    child: Text(
                      'Publicar algo vazio é díficil...',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
