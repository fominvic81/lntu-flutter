import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lntu_flutter/services/native_code_service.dart';

final dio = Dio();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.cyanAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationThemeData(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var date = "";
  Uint8List? imageBytes = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes app", textAlign: TextAlign.center)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () async {
                final dateLocal = await NativeCodeService.getNativeData() ?? "";
                setState(() {
                  date = dateLocal;
                });
              },
              child: Text("Get native data"),
            ),
            Text(date),
            ElevatedButton(onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? photo = await picker.pickImage(source: ImageSource.camera);
              final imageBytesLocal = await photo?.readAsBytes();
              if (imageBytesLocal != null) {
                setState(() {
                  imageBytes = imageBytesLocal;
                });
              }
            }, child: Text("Take photo")),
            if (imageBytes == null) const Text("No image yet(") else Image.memory(imageBytes!)
          ],
        ),
      ),
    );
  }
}
