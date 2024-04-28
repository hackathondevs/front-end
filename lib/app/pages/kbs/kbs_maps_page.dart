import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zooventure/app/pages/kbs/search_animal_page.dart';
import 'package:zooventure/app/pages/kbs/search_toilet_page.dart';

class KBSMapsPage extends StatelessWidget {
  const KBSMapsPage({super.key});

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
                  "Zoo Maps",
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1D3E)),
                ),
              ],
            ),
            SizedBox(
              height: 224.h,
            ),
            Text(
              "Mau kemana?",
              style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1D3E)),
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SearchToiletPage()));
                    },
                    child: SvgPicture.asset("assets/btn_c_toilet.svg")),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SearchAnimalPage()));
                    },
                    child: SvgPicture.asset("assets/btn_c_hewan.svg")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
