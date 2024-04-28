import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zooventure/app/routes/route_name.dart';

class SuccessReportPage extends StatelessWidget {
  const SuccessReportPage({super.key});

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
            Image.asset(
              "assets/smile_earth.png",
              width: 160.w,
              height: 160.h,
            ),
            Text(
              "Terima kasih sudah melapor",
              style: GoogleFonts.nunito(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1D3E)),
            ),
            Text(
                "Zoo Point anda akan bertambah jika admin telah memverifikasi laporan")
          ],
        ),
      ),
    );
  }
}
