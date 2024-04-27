import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackfest/app/pages/kbs/detail_campaign_page.dart';
import 'package:hackfest/app/routes/route_name.dart';

class PointPage extends StatefulWidget {
  const PointPage({super.key});

  @override
  State<PointPage> createState() => _KBSCampaignPageState();
}

class _KBSCampaignPageState extends State<PointPage> {
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
                  "Zoo Point",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Poin kamu: ",
                  style: GoogleFonts.nunito(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6D6E8C)),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/coin.svg",
                  width: 28.w,
                  height: 28.h,
                ),
                SizedBox(
                  width: 4.w,
                ),
                RichText(
                  text: TextSpan(
                    text: "500",
                    style: GoogleFonts.nunito(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6D6E8C)),
                    children: [
                      TextSpan(
                        text: "ZP",
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6D6E8C)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
              ],
            ),
            Text(
              "Zoo Point adalah poin yang kamu dapat ketika kamu memotret hewan dan melihat informasi hewan dari CAMnimal Journey. Kamu bisa menukar ZooPoint dengan potongan harga di tenant snack (bukan resto). ZooPoint kamu berlaku selama sebulan sejak kamu mendapatkannya.",
              style: GoogleFonts.nunito(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6D6E8C)),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
