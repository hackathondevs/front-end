import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zooventure/app/cubit/auth/auth_cubit.dart';
import 'package:zooventure/app/routes/route_name.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> videos = [
    {
      'judul': 'Fakta Unik Jerapah',
      'deskripsi':
          'Jerapah adalah hewan darat terbesar di dunia saat ini. Mereka bisa mencapai ketinggian sekitar 5,5 meter untuk jerapah jantan',
      'sumber': 'https://www.youtube.com/watch?v=Td9IzNCr3OE',
    },
    {
      'judul': 'Gajah',
      'deskripsi':
          'Kebun Binatang Surabaya didirikan pada tanggal 31 Juli 1916, menjadikannya salah satu kebun binatang pertama di Indonesia',
      'sumber': 'https://www.youtube.com/watch?v=EfDVk2kZxt8',
    },
  ];
  final _authCubit = AuthCubit();
  @override
  Widget build(BuildContext context) {
    final video = videos[1];
    final video0 = videos[0];
    return Scaffold(
        body: StreamBuilder(
            stream: _authCubit.stream,
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 8.h, top: 34.h, left: 16.w, right: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hai, Sandogi!",
                              style: GoogleFonts.nunito(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF1A1D3E)),
                            ),
                            Text(
                              "Pengunjung",
                              style: GoogleFonts.nunito(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF6D6E8C)),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/avatar.png",
                          width: 44.w,
                          height: 44.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 140.h,
                            child: Image.asset(
                              "assets/ads.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        left: 16.w,
                        child: Container(
                          height: 61.h,
                          width: MediaQuery.of(context).size.width - 32.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.w)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 18.w, right: 18.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Poin kamu",
                                      style: GoogleFonts.nunito(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF6D6E8C)),
                                    ),
                                    Row(
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
                                              color: const Color(0xFF6D6E8C)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/add.svg",
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          "Tambah",
                                          style: GoogleFonts.nunito(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF6D6E8C)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/cart.svg",
                                          height: 20.h,
                                          width: 20.w,
                                        ),
                                        Text(
                                          "Tukar",
                                          style: GoogleFonts.nunito(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF6D6E8C)),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Mau ngapain hari ini?",
                                  style: GoogleFonts.nunito(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1A1D3E)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      context.goNamed(RouteName.kbsJourneyPage);
                                    },
                                    child: SvgPicture.asset(
                                        "assets/btn_kbsjourney.svg")),
                                InkWell(
                                    onTap: () {
                                      context
                                          .goNamed(RouteName.kbsCampaignPage);
                                    },
                                    child: SvgPicture.asset(
                                        "assets/btn_kbscampaign.svg")),
                                InkWell(
                                    onTap: () {
                                      context.goNamed(RouteName.kbsMapsPage);
                                    },
                                    child: SvgPicture.asset(
                                        "assets/btn_kbsmaps.svg")),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Kunjungi Hewan-hewan Berikut",
                                  style: GoogleFonts.nunito(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF1A1D3E)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              height: 204.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.w)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  launchUrl(
                                    Uri.parse(video0['sumber']!),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.w),
                                          topRight: Radius.circular(8.w)),
                                      child: Image.asset(
                                        "assets/vid_jerapah.png",
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 135.h,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 11.h, left: 11.w, right: 11.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                video0['judul']!,
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF1A1D3E),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  video0['deskripsi']!,
                                                  style: GoogleFonts.nunito(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF6D6E8C),
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              height: 204.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.w)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  launchUrl(
                                    Uri.parse(video['sumber']!),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.w),
                                          topRight: Radius.circular(8.w)),
                                      child: Image.asset(
                                        "assets/vid_kbs.png",
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 135.h,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 11.h, left: 11.w, right: 11.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                video['judul']!,
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF1A1D3E),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  video['deskripsi']!,
                                                  style: GoogleFonts.nunito(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF6D6E8C),
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]))
                ]),
              );
            }));
  }
}
