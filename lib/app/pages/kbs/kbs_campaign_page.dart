import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zooventure/app/pages/kbs/success_report_page.dart';
import 'package:zooventure/app/routes/route_name.dart';
import 'package:zooventure/app/widgets/large_buttons.dart';
import 'package:zooventure/app/widgets/text_fields.dart';
import 'package:zooventure/data/datasources/local/local_storage.dart';

class KBSCampaignPage extends StatefulWidget {
  const KBSCampaignPage({super.key});

  @override
  State<KBSCampaignPage> createState() => _KBSCampaignPageState();
}

File? _selectedImages;
File? _selectedImagesFromGallery;

TextEditingController timeIncidentController = TextEditingController();
TextEditingController locationIncidentController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

class _KBSCampaignPageState extends State<KBSCampaignPage> {
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
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Zoo Report",
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1D3E)),
              )
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          Image.asset(
            "assets/zoo_report_img.png",
            height: 169.h,
            width: 160.w,
          ),
          Text(
            "Laporkan Pelanggaran",
            style: GoogleFonts.nunito(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1D3E)),
          ),
          SizedBox(
            height: 28.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Tulis Waktu Kejadian (contoh: 14:30)")],
          ),
          CustomTextField(
              controller: timeIncidentController,
              type: CustomTextFieldType.input,
              hintText: "Tulis Waktu Kejadian"),
          SizedBox(
            height: 8.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Tulis Lokasi Kejadian (contoh: Sebelah Kandang Singa)")
            ],
          ),
          CustomTextField(
              controller: timeIncidentController,
              type: CustomTextFieldType.input,
              hintText: "Tulis Lokasi Kejadian"),
          SizedBox(
            height: 8.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Deskripsi Kejadian")],
          ),
          CustomTextField(
              controller: timeIncidentController,
              type: CustomTextFieldType.input,
              hintText: "Tulis Deskripsi"),
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(382.sp, 40.sp),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: Color(0xFF5EB151),
                    width: 1.0,
                  ),
                ),
              ),
              onPressed: () {
                _insertFromGalery();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Upload Gambar",
                    style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF263238)),
                  )
                ],
              )),
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
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(
                Size(382.sp, 40.sp),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(
                  color: Color(0xFF5EB151),
                  width: 1.0,
                ),
              ),
            ),
            onPressed: () {
              _capture();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Foto Langsung",
                  style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF263238)),
                )
              ],
            ),
          ),
          const Spacer(),
          LargeButton(text: "Laporkan", onClicked: () {}),
          SizedBox(
            height: 32.h,
          )
        ],
      ),
    ));
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
        "https://hackfest.miruza.my.id/api/reports",
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $userToken"}),
      );

      if (response.statusCode == 200) {
        print("ini hasil response");
        print(response.data);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SuccessReportPage()));
      } else {
        print(
            'gagal kirim gambar ke backend. code status: ${response.statusCode}');
      }
    } catch (e) {
      print('terjadi kesalahan: $e');
    }
  }

  Future<void> _insertFromGalery() async {
    final Dio dio = Dio();
    String? userToken = await _init();
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    _selectedImages = File(image.path);

    FormData formData =
        FormData.fromMap({"picture": await MultipartFile.fromFile(image.path)});
    try {
      final response = await dio.post(
        "https://hackfest.miruza.my.id/api/reports",
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $userToken"}),
      );

      if (response.statusCode == 200) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => SuccessReportPage()),
        );
      } else {
        print(
            'gagal kirim gambar ke backend. code status: ${response.statusCode}');
      }
    } catch (e) {
      print('terjadi kesalahan: $e');
    }
  }
}
