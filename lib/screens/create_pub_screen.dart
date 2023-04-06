import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePubScreen extends StatefulWidget {
  const CreatePubScreen({super.key});

  @override
  State<CreatePubScreen> createState() => _CreatePubScreenState();
}

class _CreatePubScreenState extends State<CreatePubScreen> {
  File? _image;
  bool isEmptyTitle = false;
  bool isEmptyText = false;

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
    TextEditingController titleController = TextEditingController();
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
              controller: titleController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('Título'),
                errorText:
                    isEmptyTitle ? 'Este campo não pode ficar vazio!' : null,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: null,
              controller: textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('Texto'),
                errorText:
                    isEmptyText ? 'Este campo não pode ficar vazio!' : null,
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
              onPressed: () {
                setState(() {
                  if (titleController.text == '' ||
                      titleController.text == null) {
                    isEmptyTitle = true;
                  } else {
                    isEmptyTitle = false;
                  }

                  if (textController.text == '' ||
                      textController.text == null) {
                    isEmptyText = true;
                  } else {
                    isEmptyText = false;
                  }
                });

                if (!isEmptyText && !isEmptyTitle) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Publicar'),
            ),
          ],
        ),
      ),
    );
  }
}
