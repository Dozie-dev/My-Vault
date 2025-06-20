import 'package:flutter/material.dart';
import 'package:myvault/model/onboarding_model.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvault/utils/app_images.dart';

abstract class OnboardingEvents {}

class NextPageRequest extends OnboardingEvents {}

class PageChanged extends OnboardingEvents {
  final int pageIndex;
  PageChanged(this.pageIndex);
}

//State
class OnboardingState {
  final int currentPage;
  final List<OnboardingModel> pages;

  OnboardingState({required this.currentPage, required this.pages});

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      pages: pages,
    );
  }
}

//Controller
class OnboardingController extends Bloc<OnboardingEvents, OnboardingState> {
  Timer? timer;

  OnboardingController()
    : super(
        OnboardingState(
          currentPage: 0,
          pages: [
            OnboardingModel(
              image: AppImages.onboard1,
              text: 'Welcome to Myvault',
              text2:
                  'Simplify your financial goals and grow your wealth with ease',
            ),
            OnboardingModel(
              image: AppImages.onboard2,
              text: 'Automate your Savings',
              text2:
                  'Set up automatic savings with just a few taps while we handle the rest',
            ),
            OnboardingModel(
              image: AppImages.onboard3,
              text: 'Invest with Confidence',
              text2:
                  "We've got the tools and insights to help you invest wisely. Your money, your future.",
            ),
          ],
        ),
      ) {
    on<NextPageRequest>(onNextPage);
    on<PageChanged>(onPageChanged);
    startAutoScroll();
  }

  void onNextPage(NextPageRequest event, Emitter<OnboardingState> emit) {
    final nextIndex = (state.currentPage + 1) % state.pages.length;
    emit(state.copyWith(currentPage: nextIndex));
  }

  void onPageChanged(PageChanged event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentPage: event.pageIndex));
  }

  void startAutoScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    Future.delayed(const Duration(seconds: 3), () {
      timer = Timer.periodic(const Duration(seconds: 5), (_) {
        add(NextPageRequest());
      });
    });
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
