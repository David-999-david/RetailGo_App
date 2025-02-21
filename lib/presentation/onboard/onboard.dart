import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/onboard/data/onboard_data.dart';
import 'package:retail/presentation/onboard/notifier/onboard_notifier.dart';
import 'package:retail/presentation/onboard/widget/onboard_page.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardProvider = Provider.of<OnboardNotifier>(context);
    final PageController pageController =
        PageController(initialPage: onBoardProvider.currentPage);

    return Scaffold(
      body: SafeArea(
        child: Consumer<OnboardNotifier>(
          builder: (context, provider, child) {
            return Stack(
              children: [
                // Gradient Background
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 5, 5, 98),
                        Color.fromARGB(255, 40, 65, 114)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                // PageView (Onboarding Screens)
                PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) => provider.setPage(value),
                  itemCount: OnBoardData.length,
                  itemBuilder: (context, index) {
                    return OnboardPage(
                      image: OnBoardData[index]['image']!,
                      title: OnBoardData[index]['title']!,
                      description: OnBoardData[index]['description']!,
                    );
                  },
                ),

                // Skip Button (Top Right)
                Positioned(
                  top: 20,
                  right: 20,
                  child: provider.currentPage != OnBoardData.length - 1
                      ? TextButton(
                          onPressed: () {
                            provider.completeOnBoarding(context);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),

                // Dots Indicator
                Positioned(
                  bottom: 90,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      OnBoardData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: provider.currentPage == index ? 14 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: provider.currentPage == index
                              ? Colors.orangeAccent
                              : Colors.white38,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),

                // Navigation Buttons (Bottom)
                Positioned(
                  bottom: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous Button
                      provider.currentPage > 0
                          ? ElevatedButton(
                              onPressed: () {
                                pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                elevation: 5,
                              ),
                              child: const Text('Back'),
                            )
                          : const SizedBox(),

                      // Next / Finish Button
                      ElevatedButton(
                        onPressed: () {
                          if (provider.currentPage < OnBoardData.length - 1) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            provider.completeOnBoarding(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 5,
                        ),
                        child: Text(
                            provider.currentPage < OnBoardData.length - 1
                                ? 'Next'
                                : 'Let’s Go!'),
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
