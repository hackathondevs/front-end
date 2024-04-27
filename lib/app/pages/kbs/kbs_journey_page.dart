import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackfest/app/pages/kbs/detail_info_animal_page.dart';
import 'package:hackfest/app/routes/route_name.dart';
import 'package:hackfest/app/widgets/large_buttons.dart';
import 'package:hackfest/data/datasources/local/local_storage.dart';
import 'package:image_picker/image_picker.dart';

class CamnimalBoardPage extends StatefulWidget {
  const CamnimalBoardPage({super.key});

  @override
  State<CamnimalBoardPage> createState() => _CamnimalBoardPageState();
}

File? _selectedImages;

class _CamnimalBoardPageState extends State<CamnimalBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    context.goNamed(RouteName.mainPage);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 20.w,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 164.h,
            ),
            Image.asset(
              "assets/camnimal_board_img.png",
              width: 194.w,
              height: 152.h,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "CAMnimal Journey",
              style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1D3E)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Ketahui lebih detail tentang hewan di depanmu dan dapatkan poin hanya dengan satu klik!",
              style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6D6E8C)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24.h,
            ),
            LargeButton(
                text: "Ambil",
                onClicked: () {
                  _capture();
                }),
            SizedBox(
              height: 8.h,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(382.sp, 40.sp),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      color: Color(0xFFCFCFCF),
                      width: 1.0,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/kbs_maps_inactive.svg",
                      width: 21.w,
                      height: 19.h,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "Lihat Peta Journeymu",
                      style: GoogleFonts.nunito(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF263238)),
                    )
                  ],
                )),
            SizedBox(
              height: 16.h,
            ),
            _selectedImages != null
                ? Image.file(_selectedImages!)
                : const Text("Tolong tangkap gambar terlebih dahulu")
          ],
        ),
      ),
    );
  }

  Future<String?> _init() async {
    String? token = await LocalStorage.getUserToken();
    return token;
  }

  Future<void> _capture() async {
    final Dio dio = Dio();
    String? userToken = await _init();
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    _selectedImages = File(image.path);

    FormData formData =
        FormData.fromMap({"picture": await MultipartFile.fromFile(image.path)});
    try {
      final response = await dio.post(
        "https://hackfest.miruza.my.id/api/animals/_whatIs",
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $userToken"}),
      );

      if (response.statusCode == 200) {
        print("ini hasil response");
        print(response.data);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailInfoAnimalPage(
            responseData: response.data,
            selectedImage: _selectedImages,
          ),
        ));
      } else {
        print(
            'gagal kirim gambar ke backend. code status: ${response.statusCode}');
      }
    } catch (e) {
      print('terjadi kesalahan: $e');
    }
  }
}
