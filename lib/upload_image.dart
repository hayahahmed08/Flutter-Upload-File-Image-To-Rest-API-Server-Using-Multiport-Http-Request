import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  bool showSpinner = false;

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      print("No image selected");
    }
  }
Future<void>uploadImage()async{
    
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.photo),
            onPressed: getImage,
          ),
        ],
      ),
      body: Center(
        child: image == null
            ? const Text('Pick an Image')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              image!,
              height: 100,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
