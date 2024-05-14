import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormItem extends StatefulWidget {
  const FormItem({super.key});

  @override
  State<FormItem> createState() => _FormItemState();
}

class _FormItemState extends State<FormItem> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _imageController = TextEditingController();
  File? _imageFile;

  // Method to get image from gallery
  Future getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedFile == null) {
      return;
    }
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  // Method to upload image to Firebase Storage
  Future uploadImage(BuildContext context) async {
    String fileName = _titleController.text;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("images/$fileName");
    UploadTask uploadTask = ref.putFile(_imageFile!);
    await uploadTask.whenComplete(() async {
      _imageController.text = await ref.getDownloadURL();
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Item"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              //upload gambar
              ElevatedButton(
                onPressed: getImage,
                child: Text('Upload Image'),
              ),
              _imageFile == null
                  ? const Text('No image selected.')
                  : Stack(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 200,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10), // Melengkungkan ujung container
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // Warna bayangan
                                spreadRadius: 1, // Sebaran bayangan
                                blurRadius: 5, // Keburaman bayangan
                                offset: Offset(0, 3), // Posisi bayangan
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // Melengkungkan ujung gambar
                            child: Image.file(
                              _imageFile!,
                              fit: BoxFit
                                  .cover, // Mengisi seluruh ruang container
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                _imageFile = null;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
              TextFormField(
                controller: _subtitleController,
                decoration: const InputDecoration(
                  labelText: 'Subtitle',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await uploadImage(context);
                    DocumentReference documentReference =
                        FirebaseFirestore.instance.collection('searches').doc();
                    documentReference.set({
                      'title': _titleController.text,
                      'image': _imageController.text,
                      'subtitle': _subtitleController.text,
                      'isFavorite': false,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
