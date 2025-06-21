import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myvault/utils/app_icons.dart';
import 'package:myvault/utils/colors.dart';
import 'package:myvault/view/password_pages/password_page.dart';
import 'package:myvault/view/signup_pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.minBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 108),
            Text(
              'Login to your account',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: AppColors.text1,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 75),

            //Phone Number Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone Number',
                  style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text2,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.text2, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: TextFormField(
                      //controller: passwordController,
                      keyboardType: TextInputType.phone,
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            //Password TextField
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text2,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.text2, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: TextFormField(
                      //controller: passwordController,
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        suffixIcon: Image.asset(
                          AppIcons.password1,
                          color: AppColors.text2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasswordPage()),
                );
              },
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.text2,
                  ),
                ),
              ),
            ),

            SizedBox(height: 268),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainBackground,
                    foregroundColor: AppColors.minBackground,
                    minimumSize: Size(369, 51),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: AppColors.appBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Signup",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: AppColors.mainBackground,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 55),
            Center(
              child: Column(
                children: [
                  Text(
                    "By clicking 'Signup' you agreed to our",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(color: AppColors.text2),
                    ),
                  ),
                  Text(
                    "Terms and Conditions",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.text1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
