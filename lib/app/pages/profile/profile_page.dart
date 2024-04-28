import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20.w,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "Profile",
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1D3E)),
                )
              ],
            ),
            SizedBox(
              height: 48.h,
            ),
            Image.asset(
              "assets/avatar.png",
              width: 95.w,
              height: 95.w,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text("Sandogi"),
            SizedBox(
              height: 4.h,
            ),
            Text("Pengunjung"),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/coin.svg",
                  height: 22.h,
                  width: 22.w,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "500 ZP",
                  style: GoogleFonts.nunito(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6D6E8C)),
                )
              ],
            ),
            SizedBox(
              height: 36.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Nama Lengkap",
                  style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1D3E)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Handedius Sando Sianipar",
                  style: GoogleFonts.nunito(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6D6E8C)),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1D3E)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "handediussando@gmail.com",
                  style: GoogleFonts.nunito(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6D6E8C)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
