import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zooventure/app/cubit/point/point_cubit.dart';
import 'package:zooventure/app/widgets/large_buttons.dart';
import 'package:zooventure/app/widgets/text_fields.dart';

class PointPage extends StatefulWidget {
  const PointPage({super.key});

  @override
  State<PointPage> createState() => _KBSCampaignPageState();
}

final TextEditingController nominalController = TextEditingController();
final TextEditingController standCodeController = TextEditingController();

class _KBSCampaignPageState extends State<PointPage> {
  String formattedNominal = "";

  @override
  void initState() {
    super.initState();
    nominalController.addListener(_formatNominal);
  }

  @override
  void dispose() {
    nominalController.removeListener(_formatNominal);
    super.dispose();
  }

  void _formatNominal() {
    setState(() {
      String nominalText = nominalController.text;
      if (nominalText.isNotEmpty) {
        formattedNominal = "Rp. $nominalText";
      } else {
        formattedNominal = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                          color: const Color(0xFF6D6E8C)),
                      children: [
                        TextSpan(
                          text: "ZP",
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF6D6E8C)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Berapa poin yang mau ditukar?",
                    style: GoogleFonts.nunito(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1A1D3E)),
                  )
                ],
              ),
              CustomTextField(
                controller: nominalController,
                type: CustomTextFieldType.input,
                hintText: "Masukkan nominal",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Kode Stand",
                    style: GoogleFonts.nunito(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1A1D3E)),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextField(
                controller: standCodeController,
                type: CustomTextFieldType.input,
                hintText: 'Masukkan kode stand',
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Poin kamu akan menjadi potongan harga sebesar:",
                    style: GoogleFonts.nunito(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1A1D3E)),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 48.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFF1481D0)),
                  borderRadius: BorderRadius.all(Radius.circular(8.w)),
                ),
                child: Center(
                  child: Text(formattedNominal,
                      style: GoogleFonts.nunito(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5183B1))),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              LargeButton(
                  text: "Tukarkan Kode",
                  onClicked: () {
                    context.read<PointCubit>().changePoint(
                        int.parse(nominalController.text),
                        standCodeController.text);
                  }),
              SizedBox(
                height: 28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Riwayat Penukaran",
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1D3E)),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stand Ibu Rohman",
                        style: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A1D3E)),
                      ),
                      Text(
                        "2 April 2024",
                        style: GoogleFonts.nunito(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6D6E8C)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "2000ZP",
                        style: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6D6E8C)),
                      ),
                      Text(
                        "Berhasil",
                        style: GoogleFonts.nunito(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5EB151)),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
