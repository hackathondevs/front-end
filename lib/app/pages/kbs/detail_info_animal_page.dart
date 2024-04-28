import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zooventure/app/pages/kbs/quiz_journey_page.dart';
import 'package:zooventure/app/widgets/large_buttons.dart';
import 'package:zooventure/data/models/animal.dart';

class DetailInfoAnimalPage extends StatelessWidget {
  final Map<String, dynamic> responseData;
  final File? selectedImage;

  const DetailInfoAnimalPage({
    super.key,
    required this.responseData,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    var animal = Animal.fromJson(responseData);
    animalList.add(animal);
    return Scaffold(
        body: Column(children: [
      if (selectedImage != null)
        Image.file(
          selectedImage!,
          width: MediaQuery.of(context).size.width,
          height: 230.h,
          fit: BoxFit.fill,
        ),
      Padding(
        padding: EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  animal.name,
                  style: GoogleFonts.nunito(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1D3E)),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(animal.origin),
                Text(animal.latin),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Karakteristik",
                  style: GoogleFonts.nunito(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF37373A)),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    animal.characteristic,
                    style: GoogleFonts.nunito(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6D6E8C)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Jenis Makanan",
                  style: GoogleFonts.nunito(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF37373A)),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  animal.diet,
                  style: GoogleFonts.nunito(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6D6E8C)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Rata-rata Usia Hidup",
                  style: GoogleFonts.nunito(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF37373A)),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  animal.lifespan,
                  style: GoogleFonts.nunito(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6D6E8C)),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 126.h,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFB4B4B4)),
                  borderRadius: BorderRadius.all(Radius.circular(12.w))),
              child: Column(
                children: [
                  Text(
                    "Fun Fact",
                    style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5EB151)),
                  ),
                  Row(
                    children: [
                      Image.network(
                        animal.picture,
                        height: 80.h,
                        width: 20.w,
                      ),
                      Text("")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/coin.svg",
                  width: 14.w,
                  height: 14.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => QuizJourneyPage()));
                  },
                  child: Text(
                    "Kerjakan kuis untuk mendapat poin",
                    style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5EB151)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            LargeButton(text: "Lanjut Jelajah Kebun Binatang", onClicked: () {})
          ],
        ),
      )
    ]));
  }
}
