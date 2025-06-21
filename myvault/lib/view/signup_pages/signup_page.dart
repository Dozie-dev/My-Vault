import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myvault/utils/colors.dart';
import 'package:myvault/view/signup_pages/otp_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formkey = GlobalKey<FormState>();

  //Controllers
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void continueForm(BuildContext context, dynamic formKey) {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtpPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.minBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Form(
              key: formkey,
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
                          color: AppColors.ashcont,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 33),

                  SizedBox(
                    width: 287,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign up to Myvault',
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
                          'Setup your personal Vault account',
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

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.formtext,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.greycont,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: TextFormField(
                            controller: firstnameController,
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

                  //Last Name TextField
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.formtext,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.greycont,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: TextFormField(
                            controller: lastnameController,
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

                  // Phone Number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.formtext,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.greycont,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: TextFormField(
                            controller: phoneController,
                            style: GoogleFonts.manrope(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              } else if (value.length < 10) {
                                return 'Phone number must be at least 10 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Password',
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.formtext,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.greycont,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: TextFormField(
                            controller: passwordController,
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
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 113),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainBackground,
                      foregroundColor: AppColors.minBackground,
                      minimumSize: Size(369, 47),
                    ),
                    onPressed: () => continueForm(context, formkey),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
          ),
        ),
      ),
    );
  }
}
