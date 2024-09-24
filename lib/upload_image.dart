import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class upload_image extends StatefulWidget {
  const upload_image({super.key});

  @override
  State<upload_image> createState() => _upload_imageState();
}

class _upload_imageState extends State<upload_image> {

File? image;
final _picker = ImagePicker();
bool showSpinner = false;

Future getImage()async{
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up API'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center
        ,
          children: [
            Container(
              child: image == null? Center(child: Text('Pick Image'),)
            ),
            Container(
              child: Center(
                child: Image.file(File(
                  image!.path).absolute,
                    height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        )
    );
  }
}