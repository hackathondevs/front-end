import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackfest/app/cubit/auth/auth_cubit.dart';
import 'package:hackfest/app/routes/route_name.dart';
import 'package:hackfest/app/widgets/large_buttons.dart';
import 'package:hackfest/app/widgets/loading.dart';
import 'package:hackfest/app/widgets/snackbar.dart';
import 'package:hackfest/app/widgets/text_fields.dart';

import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmationPasswordController = TextEditingController();

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginPage()));
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
                    "assets/signup_img.png",
                    width: 248.w,
                    height: 146.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text("Halo! Silahkan daftar.",
                        style: GoogleFonts.nunito(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Nama")],
                  ),
                  CustomTextField(
                      controller: nameController,
                      type: CustomTextFieldType.input,
                      hintText: "Masukkan Nama"),
                  SizedBox(
                    height: 8,
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
                    height: 8,
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
                  SizedBox(
                    height: 8,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Konfirmasi Password")],
                  ),
                  CustomTextField(
                    controller: confirmationPasswordController,
                    type: CustomTextFieldType.inputPasswordAndHint,
                    obscure: true,
                    hintText: 'Konfirmasi Password',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LargeButton(
                      text: "Daftar",
                      onClicked: () {
                        context.read<AuthCubit>().signup(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            confirmationPasswordController.text);
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
                      text: "Sudah punya akun? ",
                      style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6D6E8C)),
                      children: [
                        TextSpan(
                          text: "Masuk",
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5EB151)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed(RouteName.loginPage);
                            },
                        ),
                      ],
                    ),
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
