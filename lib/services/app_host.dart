import 'dart:convert';

import 'package:appoint_it/utils/dispatchpro_storage.dart';

class AppHost {
  // API Messages for User Feedback
  static const String apiExceptionMsg =
      "Something went wrong. Please try again later.";
  static const String apiBadResponseMsg =
      'Received an invalid response from the server.';
  static const String noInternetMsg =
      'No internet connection. Please connect to the internet and try again.';
  static String? token;

  // Default API Headers
  static Future<Map<String, String>> get apiHeaders async {
    print('Bearer $token');
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Function to refresh headers if needed (e.g., after token renewal)
  static Future<void> updateHeaders() async {
    await apiHeaders;
  }

  // Clear the stored token if needed
  static Future<void> clearAuthorizationToken() async {
    await DispatchProCustomerStorage.cleanData();
  }

  // Encoding used in API communication
  final encoding = Encoding.getByName('utf-8');
}
