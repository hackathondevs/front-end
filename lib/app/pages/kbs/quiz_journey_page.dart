import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizJourneyPage extends StatelessWidget {
  const QuizJourneyPage({super.key});

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
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8.w,
                ),
              ],
            ),
            SizedBox(
              height: 108.h,
            ),
            Image.asset(
              "assets/qwst.png",
              height: 166.h,
              width: 166.w,
            )
          ],
        ),
      ),
    );
  }
}
