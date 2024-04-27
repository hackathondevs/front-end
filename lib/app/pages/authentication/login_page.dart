import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackfest/app/cubit/auth/auth_cubit.dart';
import 'package:hackfest/app/pages/home/main_page.dart';
import 'package:hackfest/app/routes/route_name.dart';
import 'package:hackfest/app/widgets/large_buttons.dart';
import 'package:hackfest/app/widgets/loading.dart';
import 'package:hackfest/app/widgets/snackbar.dart';
import 'package:hackfest/app/widgets/text_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool? isChecked = false;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.goNamed(RouteName.mainPage);
          } else if (state is AuthError) {
            showSnackBarWidget(
              context,
              state.error,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loading();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Image.asset(
                    "assets/login_img.png",
                    width: 248.w,
                    height: 146.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text("Halo! Selamat datang.",
                        style: GoogleFonts.nunito(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Email")],
                  ),
                  CustomTextField(
                      controller: emailController,
                      type: CustomTextFieldType.input,
                      hintText: "Masukkan Email"),
                  SizedBox(
                    height: 8.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Password")],
                  ),
                  CustomTextField(
                    controller: passwordController,
                    type: CustomTextFieldType.inputPasswordAndHint,
                    obscure: true,
                    hintText: 'Masukkan Password',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value;
                            });
                          }),
                      Text(
                        "Ingat saya",
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6D6E8C)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 152.h,
                  ),
                  LargeButton(
                      text: "Login",
                      onClicked: () {
                        context.read<AuthCubit>().login(
                              emailController.text,
                              passwordController.text,
                              isChecked!,
                            );
                      }),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "atau",
                    style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF6D6E8C)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(328.w, 44.h)),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/google.png",
                          width: 17.w,
                          height: 17.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Login menggunakan Google",
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D6E8C)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Belum punya akun? ",
                      style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6D6E8C)),
                      children: [
                        TextSpan(
                          text: "Daftar",
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5EB151)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed(RouteName.signupPage);
                            },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => MainPage()));
                    },
                    child: Text("ke main Page"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
