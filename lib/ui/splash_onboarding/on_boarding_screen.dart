import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:flutter/material.dart';
import '../../core/utils/colors_manager.dart';
import '../../core/utils/text_style_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<Map<String, String>> pages = [
    {
      'title': AppStrings.onBoardingOne,
      'subtitle': AppStrings.subtitle,
      'image': 'assets/images/splash_onboarding/onboarding_1.png',
    },
    {
      'title': AppStrings.onBoardingTwo,
      'subtitle': AppStrings.subtitle,
      'image': 'assets/images/splash_onboarding/onboarding_2.png',
    },
    {
      'title': AppStrings.onBoardingThree,
      'subtitle': AppStrings.subtitle,
      'image': 'assets/images/splash_onboarding/onboarding_3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_onboarding/onboarding_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    widthFactor: 0.82,
                    child: Image.asset(
                      pages[index]['image']!,
                      height: 600,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 5,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouteManager.loginScreen);
                      },
                      child: Text(AppStrings.skip,
                          style: AppTextStyle.regular16
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: BlurredContainer(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(pages[index]['title']!,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bold30),
                            const SizedBox(height: 12),
                            Text(
                              pages[index]['subtitle']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                pages.length,
                                (dotIndex) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width: _currentPage == dotIndex ? 30 : 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: _currentPage == dotIndex
                                        ? ColorManager.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            _currentPage == 0
                                ? SizedBox(
                                    width: 380,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorManager.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 14),
                                      ),
                                      child: Text(AppStrings.next),
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _controller.previousPage(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeIn,
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              side: const BorderSide(
                                                  color:
                                                      ColorManager.primaryColor,
                                                  width: 2),
                                            ),
                                          ),
                                          child: Text(AppStrings.back),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_currentPage ==
                                                pages.length - 1) {
                                              Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                RouteManager.registerScreen,
                                                (route) => false,
                                              );
                                            } else {
                                              _controller.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeIn,
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorManager.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: _currentPage == 1
                                              ? Text(AppStrings.next)
                                              : Text(AppStrings.doIt),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
