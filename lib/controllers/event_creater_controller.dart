import 'dart:convert';
import 'package:appoint_it/routing/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';
import 'package:appoint_it/utils/helper_functions.dart';
import 'package:appoint_it/constrecter/data_const.dart';
import 'package:appoint_it/utils/dispatchpro_storage.dart';

class EventCreaterController {
  Future<void> createEvent({required Map jsonFormeted}) async {
    try {
      final BearerToken = await DispatchProCustomerStorage.getValue(DataConstants.BearerToken);
      final primeryCalandarId = await DispatchProCustomerStorage.getValue(
          DataConstants.kprimeryCalanderId);

      print(jsonFormeted);

      print('pri id ${primeryCalandarId}');

      print("bearer token ${BearerToken}");

      final response = await http.post(
          Uri.parse(
              "https://www.googleapis.com/calendar/v3/calendars/${primeryCalandarId.toString()}/events"),
          body: jsonEncode(jsonFormeted),
          headers: {
            "Authorization": "Bearer $BearerToken",
            "Content-Type": "application/json",
            "Accept": "application/json",
          });

      print(response.statusCode);
      final body = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        HelperFunctions.displayToastMessage(
            'Event created sueeced fully', ToastificationType.success);
        print('Event created sueeced fully');
      } else {
        HelperFunctions.displayToastMessage('An error occupie please try again later', ToastificationType.error);
        print('can\'t hit the api');
      }

      print(body);
    } catch (e) {
      print("error $e");
    }
  }
}
