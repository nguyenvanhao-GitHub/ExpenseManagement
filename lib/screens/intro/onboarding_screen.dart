import 'package:expense_management_app/constants/app_routers.dart';
import 'package:expense_management_app/constants/app_text_styles.dart';
import 'package:expense_management_app/widgets/app_image.dart';
import 'package:expense_management_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _slides = [
    OnboardingSlide(
      title: 'Note Down Expenses',
      description: 'Daily note your expenses to\n help manage money',
      imageAsset: AppConstants.onBoardingImage1,
    ),
    OnboardingSlide(
      title: 'Simple Money Management',
      description:
          'Get your notifications or alert\n when you do the over expenses',
      imageAsset: AppConstants.onBoardingImage2,
    ),
    OnboardingSlide(
      title: 'Easy to Track and Analize',
      description: "Tracking your expense help make sure\n you don't overspend",
      imageAsset: AppConstants.onBoardingImage3,
    ),
  ];

  void nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.goNamed(AppRouters.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage(
            assets: AppConstants.splashMedium,
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 420,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                return _slides[index];
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 16,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.electricBlue
                        : AppColors.highLightButton,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 40),
          CustomButton(textButton: "LET'S GO", onPressed: nextPage),
        ],
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  const OnboardingSlide({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImage(
          assets: imageAsset,
          width: 250,
          height: 320,
          fit: BoxFit.contain,
        ),
        Text(
          title,
          style: AppTextStyles.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: AppTextStyles.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
