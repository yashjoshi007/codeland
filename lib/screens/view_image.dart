import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../components/btn.dart';

void main() {
  runApp(MaterialApp(
    home: ImageUploadPage(),
  ));
}

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  ImageProvider _image = AssetImage('assets/placeholder.png');
  bool _imageUploaded = false;
  bool _isViewPressed = false;

  Future<void> _uploadImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = pickedFile.path;
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('uploads/image.png')
            .putFile(File(file));
        setState(() {
          _image = FileImage(File(file));
          _imageUploaded = true;
        });
        print('uploading image');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image uploaded successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Upload Image',
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image(
                image: _isViewPressed && _imageUploaded ?_image:AssetImage('assets/placeholder.png')  ,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               RectangularButton(
                 text: 'Upload',
                 color: Colors.orange,
                 onPressed: () { _uploadImage(context); },
                 btnText: Colors.white,

               ),
               RectangularButton(
                 text: 'View',
                 color: Colors.grey,
                  onPressed: () {
                    if (_imageUploaded) {
                      setState(() {
                        _image = _image;
                        _isViewPressed = true;
                      });
                    }
                  },
                   btnText: Colors.black87,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
