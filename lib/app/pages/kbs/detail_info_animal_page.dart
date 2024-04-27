import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackfest/data/models/animal.dart';

class DetailInfoAnimalPage extends StatelessWidget {
  final String responseData;
  final File? selectedImage;

  const DetailInfoAnimalPage({
    super.key,
    required this.responseData,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = jsonDecode(responseData);
    var animal = Animal.fromJson(data);
    print("halo gaissss, ${animal.name}");
    return Scaffold(
        body: Column(children: [
      if (selectedImage != null)
        Image.file(
          selectedImage!,
          width: MediaQuery.of(context).size.width,
          height: 230.h,
          fit: BoxFit.fill,
        ),
      const Text(
        'Data Response:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      const Text(
        'Data Response:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text('Name: ${animal.name} Latin: ${animal.latin}'),
    ]));
  }
}
