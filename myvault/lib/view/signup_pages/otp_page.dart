import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myvault/utils/app_icons.dart';
import 'package:myvault/utils/colors.dart';
import 'package:myvault/view/login_pages/login_page.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.appBlack,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.pinbox),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.minBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 33),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 165,
                    decoration: BoxDecoration(
                      color: AppColors.greencont,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    height: 8,
                    width: 165,
                    decoration: BoxDecoration(
                      color: AppColors.greencont,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(AppIcons.check),
                ],
              ),

              SizedBox(height: 33),

              SizedBox(
                width: 287,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter OTP',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text1,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Enter OTP code sent to ********4321',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.text2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              Pinput(
                length: 6,
                controller: pinController,
                defaultPinTheme: defaultPinTheme,
              ),

              SizedBox(height: 16),

              Row(
                children: [
                  Image.asset(AppIcons.loading),
                  SizedBox(width: 8),
                  Text(
                    'Resend Code',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: AppColors.text2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 100),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainBackground,
                  foregroundColor: AppColors.minBackground,
                  minimumSize: Size(369, 47),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Text(
                  'Verify OTP',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
