import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myvault/model_view/onboarding_controller.dart';
import 'package:myvault/utils/colors.dart';
import 'package:myvault/view/login_pages/login_page.dart';
import 'package:myvault/view/signup_pages/signup_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingController(),
      child: Scaffold(
        backgroundColor: AppColors.minBackground,
        body: BlocConsumer<OnboardingController, OnboardingState>(
          listener: (context, state) {
            if (pageController.hasClients &&
                state.currentPage != pageController.page?.round()) {
              pageController.animateToPage(
                state.currentPage,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            }
          },
          builder: (context, state) {
            final bloc = context.read<OnboardingController>();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 455,
                  width: 393,
                  decoration: BoxDecoration(
                    color: AppColors.onbCont,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(158),
                      bottomRight: Radius.circular(158),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: AppColors.appBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: state.pages.length,
                          onPageChanged: (index) {
                            bloc.add(PageChanged(index));
                          },
                          itemBuilder: (context, index) {
                            final item = state.pages[index];
                            return Image.asset(item.image, height: 354);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.pages.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            state.currentPage == index
                                ? AppColors.mainBackground
                                : AppColors.smallCont,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 287,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.pages[state.currentPage].text,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.text1,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          state.pages[state.currentPage].text2,
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
                ),

                SizedBox(height: 51),

                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainBackground,
                          foregroundColor: AppColors.minBackground,
                          minimumSize: const Size(294, 47),
                        ),
                        child: Text(
                          'Create Account',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 53,
                          height: 19,
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.inter(
                              color: AppColors.mainBackground,
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
