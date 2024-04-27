// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:hackfest/data/datasources/local/local_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class AnimalRepository {
//   Future<String?> _init() async {
//     String? token = await LocalStorage.getUserToken();
//     return token;
//   }

//   Future<void> _capture(File? _selectedImages) async {
//     final Dio dio = Dio();
//     String? userToken = await _init();
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image == null) return;

//     _selectedImages = File(image.path);

//     FormData formData =
//         FormData.fromMap({"picture": await MultipartFile.fromFile(image.path)});
//     try {
//       final response = await dio.post(
//         "https://hackfest.miruza.my.id/api/animals/_whatIs",
//         data: formData,
//         options: Options(headers: {"Authorization": "Bearer $userToken"}),
//       );

//       if (response.statusCode == 200) {
//         print("ini hasil response");
//         print(response.data);
//         ;
//       } else {
//         print(
//             'gagal kirim gambar ke backend. code status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('terjadi kesalahan: $e');
//     }
//   }
// }
