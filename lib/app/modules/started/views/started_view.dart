import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/started_controller.dart';

// The StartedView class extends GetView for using the GetX controller in the view
class StartedView extends GetView<StartedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration image for the get started page
            Image.asset(
              'assets/start_image.png',
              height: 200,
            ),
            SizedBox(height: 40),
            // Title text for the get started page
            Text(
              'Find the Best Electronics Service Experts with Ease',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Subtitle text explaining the services
            Text(
              'Need repairs for your electronic gadgets? From smartphones and tablets to laptops, we provide professional repair services for all your tech devices!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 40),
            // Button to navigate to home (handled by controller)
            ElevatedButton(
              onPressed: () => controller.goToHome(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ), backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button color
              ),
              child: Text(
                "Let's Get Started",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            // GestureDetector to navigate to Sign In page (handled by controller)
            GestureDetector(
              onTap: () => controller.goToSignIn(),
              child: Text(
                'Already have an account? Sign In',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}