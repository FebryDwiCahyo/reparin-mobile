import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();

    // List of contents for the onboarding screens
    final List<Map<String, String>> onboardingContents = [
      {
        'title': 'Explore Professional Services Provider',
        'description': 'Do you need repairs for your electronic devices?...',
        'image': 'assets/onboarding.png',
      },
      {
        'title': 'Explore Services by Interactive Map',
        'description': 'Looking for local providers near you?...',
        'image': 'assets/onboarding.png',
      },
      {
        'title': 'Start a Conversation with Service Providers',
        'description': 'Want to discuss your service needs?...',
        'image': 'assets/onboarding.png',
      },
    ];

    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            // Skip button at the top right
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => controller.skipOnboarding(),
                child: const Text('Skip'),
              ),
            ),

            // Image in the center
            Expanded(
              flex: 3,
              child: Image.asset(
                onboardingContents[controller.currentPage.value]['image']!,
                fit: BoxFit.cover,
              ),
            ),

            // Text description section
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      onboardingContents[controller.currentPage.value]['title']!,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      onboardingContents[controller.currentPage.value]['description']!,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Navigation buttons (Back, Next)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  Visibility(
                    visible: controller.currentPage.value != 0, // Hide back button on first page
                    child: IconButton(
                      onPressed: () => controller.previousPage(),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),

                  // Dots indicator
                  Row(
                    children: List.generate(
                      onboardingContents.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentPage.value == index
                              ? Colors.teal
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  // Next Button
                  IconButton(
                    onPressed: () => controller.nextPage(),
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
