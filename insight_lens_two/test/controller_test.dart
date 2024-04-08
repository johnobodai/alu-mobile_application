import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mockito/mockito.dart';
import 'package:insight_lens_two/controllers/user_controller.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:insight_lens_two/pages/camera_screen.dart';

void main() {
  group('UserController', () {
    test('loginWithGoogle - success', () async {
      // Setup
      final userController = UserController();

      // Perform the test
      final user = await UserController.loginWithGoogle();

      // Verify the result
      expect(user, isNotNull);
      
    });

    
  });
}
