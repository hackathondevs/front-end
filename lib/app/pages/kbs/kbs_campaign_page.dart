import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackfest/app/pages/kbs/detail_campaign_page.dart';
import 'package:hackfest/app/routes/route_name.dart';

class KBSCampaignPage extends StatefulWidget {
  const KBSCampaignPage({super.key});

  @override
  State<KBSCampaignPage> createState() => _KBSCampaignPageState();
}

class _KBSCampaignPageState extends State<KBSCampaignPage> {
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
                "KBS Campaign",
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
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  padding: MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.w)),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xFFF8F8F8)),
                  hintText: "Cari di KBS...",
                  hintStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6D6E8C))),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(
                    Icons.search,
                    color: Color(0xFF6D6E8C),
                  ),
                );
              }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              })),
          SizedBox(
            height: 16.h,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const DetailCampaignPage()));
            },
            child: Container(
              height: 206.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.w),
                        topRight: Radius.circular(8.w)),
                    child: Image.asset(
                      "assets/vid_kbs.png",
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: 170.h,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 13.h, left: 11.w, right: 11.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Buang Sampah Plastik di Tong Kuning",
                          style: GoogleFonts.nunito(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A1D3E),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/coin.svg",
                              width: 12.w,
                              height: 12.h,
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              "100 ZP",
                              style: GoogleFonts.nunito(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6D6E8C)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
