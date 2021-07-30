import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LostAndFoundPage extends StatefulWidget {
  const LostAndFoundPage({Key? key}) : super(key: key);

  @override
  _LostAndFoundPageState createState() => _LostAndFoundPageState();
}

class _LostAndFoundPageState extends State<LostAndFoundPage> {
  File? _imageFile;
  final picker = ImagePicker();
  Future chooseImage() async {
    final getImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (getImage != null) {
        _imageFile = File(getImage.path);
      } else {
        print('no image selected');
      }
    });
  }
  //iOS照片无法显示，Android可以
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('失物招领'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: () => chooseImage(),
        ),
        body: _imageFile != null
            ? Center(
                child: Image.file(_imageFile!),
              )
            : Center());
  }
}
