import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera/camera.dart';
import 'package:insight_lens_two/pages/camera_screen.dart';

void main() {
  testWidgets('Camera screen widget test', (WidgetTester tester) async {
    // Mock availableCameras function
    TestWidgetsFlutterBinding.ensureInitialized();

    late CameraController controller;

    // Set up the camera controller
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    // Start initialization but don't await it
    controller.initialize();

    // Pump the widget with the camera controller
    await tester.pumpWidget(
      MaterialApp(
        home: CameraScreen(cameraController: controller),
      ),
    );

    // Wait for 3 seconds for the camera to initialize
    await Future.delayed(const Duration(seconds: 3));

    // Pump and settle the widget after the delay
    await tester.pumpAndSettle();

    // Expect success after the delay
    expect(find.byType(CameraScreen), findsOneWidget);
  });
}
