import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zooventure/app/routes/route_name.dart';
import 'package:zooventure/app/widgets/large_buttons.dart';
import 'package:zooventure/app/widgets/text_fields.dart';

class DetailCampaignPage extends StatefulWidget {
  const DetailCampaignPage({super.key});

  @override
  State<DetailCampaignPage> createState() => _DetailCampaignPageState();
}

final TextEditingController linkController = TextEditingController();

class _DetailCampaignPageState extends State<DetailCampaignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
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
              "Detail Campaign",
              style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1D3E)),
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
      SizedBox(
        height: 24.h,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/vid_kbs.png",
          fit: BoxFit.fill,
          height: 212.h,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Buang Sampah Plastik di Tong Kuning",
              style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1D3E)),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Tentang Kampanye",
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF37373A)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Membuang sampah di tong kuning akan memudahkan proses pembersihan dan daur ulang karena sampah plastik akan diproses lebih lanjut untuk didaur ulang kembali. Upload fotomu sedang membuang sampah plastik di tempat sampah kuning untuk mengikuti kampanye ini, kemudian kumpulkan link kamu",
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6D6E8C)),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Reward",
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF37373A)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/coin.svg",
                  width: 16.w,
                  height: 16.h,
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  "100 ZP",
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6D6E8C)),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Tentang Kampanye",
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF37373A)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Membuang sampah di tong kuning akan memudahkan proses pembersihan dan daur ulang karena sampah plastik akan diproses lebih lanjut untuk didaur ulang kembali. Upload fotomu sedang membuang sampah plastik di tempat sampah kuning untuk mengikuti kampanye ini, kemudian kumpulkan link kamu",
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6D6E8C)),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Tentang Kampanye",
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF37373A)),
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextField(
                controller: linkController,
                type: CustomTextFieldType.input,
                hintText: "link dokumentasi instagram"),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Pemberian Reward",
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF37373A)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Zoo Point kamu akan bertambah jika kamu memenuhi syarat dan admin telah memverifikasi kampanye kamu.",
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6D6E8C)),
            ),
            SizedBox(
              height: 8.h,
            ),
            LargeButton(text: "Kumpulkan", onClicked: () {})
          ],
        ),
      )
    ]));
  }
}
