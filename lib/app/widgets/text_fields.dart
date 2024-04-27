import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomTextFieldType {
  inputPassword,
  inputAndHint,
  input,
  inputSearch,
  inputPasswordAndHint,
  inputAndIcon,
  inputWithIconAndHint,
  inputAndSuffix,
  inputWithSuffixAndHint
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final CustomTextFieldType type;
  final String hintText;
  final bool obscure;
  final TextInputType keyboardType;
  final String? suffixText;
  final String? suffixIcon;
  final String openedEyeIcon;
  final String closedEyeIcon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.type,
    required this.hintText,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    this.suffixText,
    this.suffixIcon,
    this.closedEyeIcon = 'assets/icons/eye-close-line.png',
    this.openedEyeIcon = 'assets/icons/eye-line.png',
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 382.w,
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure && isObscure,
        decoration: _getDecoration(),
        style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFD0D5DD)),
      ),
    );
  }

  InputDecoration _getDecoration() {
    const focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF5EB151), width: 1.5),
    );
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: Color(0xFFE9E9E9), width: 1.5),
    );
    final suffixIcon = widget.obscure
        ? InkWell(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Image.asset(
              isObscure ? widget.closedEyeIcon : widget.openedEyeIcon,
              height: 16.h,
              width: 16.w,
            ),
          )
        : (widget.suffixIcon != null
            ? InkWell(
                onTap: () {},
                child: Image.asset(
                  widget.suffixIcon!,
                  height: 16.h,
                  width: 16.w,
                ),
              )
            : null);

    Widget? suffixTextWidget = widget.suffixText != null
        ? Text(
            widget.suffixText!,
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFD0D5DD)),
          )
        : null;

    switch (widget.type) {
      case CustomTextFieldType.inputPassword:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          suffixIcon: suffixIcon,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputAndHint:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.input:
        return InputDecoration(
          focusColor: Color(0xFF3F277D),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputSearch:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          prefixIcon: Image.asset('assets/search-2-line.png'),
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputPasswordAndHint:
        return InputDecoration(
          fillColor: Color(0xFF3F277D),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          suffixIcon: Align(widthFactor: 1, heightFactor: 1, child: suffixIcon),
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputAndIcon:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          suffixIcon: suffixIcon,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputWithIconAndHint:
        return InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          suffixIcon: suffixIcon,
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputAndSuffix:
        return InputDecoration(
          suffix: suffixTextWidget,
          suffixStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF677487)),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
      case CustomTextFieldType.inputWithSuffixAndHint:
        return InputDecoration(
          suffix: suffixTextWidget,
          suffixStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF677487)),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD0D5DD)),
          border: border,
          focusedBorder: focusedBorder,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        );
    }
  }
}
