import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zooventure/app/routes/route_name.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/onboarding/1.png",
      "title": "Pahami Lingkunganmu",
      "content": "Ayo mulai lestarikan lingkungan sekitarmu",
    },
    {
      "image": "assets/onboarding/2.png",
      "title": "Jaga lingkunganmu",
      "content": "Berikan perhatian yang terhadap keberlanjutan lingkunganmu",
    },
    {
      "image": "assets/onboarding/3.png",
      "title": "Tunjukkan kontribusimu!",
      "content":
          "Cintai lingkungan untuk hidup yang lebih baik dan lebih sehat",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) => OnboardingContents(
                    image: onboardingData[index]["image"]!,
                    title: onboardingData[index]["title"]!,
                    content: onboardingData[index]["content"]!,
                    current: currentPage,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => buildDots(index),
                ).toList(),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDots(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.h,
      width: currentPage == index ? 44.w : 10.w,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: currentPage == index
              ? const Color(0xFFEEA02B)
              : const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

class OnboardingContents extends StatelessWidget {
  const OnboardingContents(
      {super.key,
      required this.image,
      required this.title,
      required this.content,
      required this.current});

  final String image, title, content;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (current == 2)
          Text("",
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: Colors.white,
              ))
        else
          InkWell(
            onTap: () {
              context.goNamed(RouteName.loginPage);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  "Lewati",
                  style: GoogleFonts.nunito(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Column(
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF62BA54),
                    )),
                Text(
                  content,
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Image.asset(
          image,
        )),
      ],
    );
  }
}
