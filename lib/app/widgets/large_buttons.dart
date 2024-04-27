import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const LargeButton({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => Center(
          child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size(328.w, 44.h)),
        ),
        onPressed: onClicked,
        child: Text(
          text,
          style: GoogleFonts.nunito(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ));
}
