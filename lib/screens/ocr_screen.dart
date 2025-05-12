import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../services/ocr_service.dart';

class OCRScreen extends StatefulWidget {
  const OCRScreen({super.key});

  @override
  OCRScreenState createState() => OCRScreenState();
}

class OCRScreenState extends State<OCRScreen> {
  File? imageFile;
  String extractedText = "";
  final ocrService = OCRService();

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked != null) {
      imageFile = File(picked.path);
      final text = await ocrService.extractTextFromImage(imageFile!);
      setState(() {
        extractedText = text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan Item")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(onPressed: pickImage, child: Text("Capture Image")),
            SizedBox(height: 20),
            imageFile != null ? Image.file(imageFile!) : Container(),
            SizedBox(height: 20),
            Text(extractedText),
          ],
        ),
      ),
    );
  }
}
