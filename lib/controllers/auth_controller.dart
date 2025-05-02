import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:toastification/toastification.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:appoint_it/routing/app_navigator.dart';
import 'package:appoint_it/utils/helper_functions.dart';
import 'package:appoint_it/constrecter/data_const.dart';
import 'package:appoint_it/routing/app_route_names.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:appoint_it/utils/dispatchpro_storage.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:appoint_it/controller_view/main_screen_controller.dart';

class AuthController {
  GoogleSignIn googleSignIn = GoogleSignIn();
  AuthClient? authClient;

  Future<void> signIn() async {
    try {
      GoogleSignInAccount? googleAccount = googleSignIn.currentUser;

      if (kIsWeb || Platform.isAndroid) {
        googleSignIn = GoogleSignIn(
          clientId: DataConstants.clientId,
          scopes: DataConstants.androidScopes,
          serverClientId: DataConstants.serverClintId,
        );
      }

      if (Platform.isIOS || Platform.isMacOS) {
        googleSignIn = GoogleSignIn(
          clientId: DataConstants.clientId,
          scopes: DataConstants.iosScopes,
          serverClientId: DataConstants.serverClintId,
        );
      }

      googleAccount = await googleSignIn.signIn();

      if (googleAccount == null) {
        HelperFunctions.displayToastMessage(
            'Sign-in canceled by the user.', ToastificationType.error);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;

      print('idToken ${googleAuth.idToken}');
      print('accessToken ${googleAuth.accessToken}');

      // retun if googlen idtoken/secart key is not find
      if (googleAuth.idToken == null) {
        await googleSignIn.signOut();
        HelperFunctions.displayToastMessage(
            "An error occupied, try again later", ToastificationType.success);
        return;
      }

      final auth.AuthClient authenticatedClient = auth.authenticatedClient(
        http.Client(),
        AccessCredentials(
          AccessToken('Bearer', googleAuth.accessToken!,
              DateTime.now().add(Duration(minutes: 60)).toUtc()),
          googleAuth.idToken, // Refresh token (null for some users)
          DataConstants.androidScopes,
        ),
      );

      print('scopes ${authenticatedClient.credentials.scopes}');
      print('idToken ${authenticatedClient.credentials.idToken}');
      print('accessToken ${authenticatedClient.credentials.accessToken}');
      print('refreshToken ${authenticatedClient.credentials.refreshToken}');

      if (!authenticatedClient.credentials.accessToken.hasExpired) {
        final calendar.CalendarApi calendarApi =
            calendar.CalendarApi(authenticatedClient);
        print(calendarApi);

        final calendar.CalendarList calanderlist =
            await calendarApi.calendarList.list();

        for (var calander in calanderlist.items!) {
          if (calander.primary == true) {
            DispatchProCustomerStorage.setValue(
                DataConstants.kprimeryCalanderId, calander.id ?? "");
            print('primaryCalander: ${calander.id}');
          }
        }
        print('checking token ${authenticatedClient.credentials.accessToken}');
        DispatchProCustomerStorage.setValue(DataConstants.BearerToken,
            authenticatedClient.credentials.accessToken.data.toString());
        HelperFunctions.displayToastMessage(
            'Sign-In Sueeced fully', ToastificationType.success);
        AppNavigation.pushReplacementTo(AppRoutesNames.mainScreen);
        
      } else {
        HelperFunctions.displayToastMessage(
            'Sign-In Field', ToastificationType.error);
      }
    } catch (e) {
      print('error $e');
    }
  }

  Future<void> googleSignOut() async {
    await googleSignIn.signOut();
    Get.delete<MainScreenController>();
    AppNavigation.removeAllRoutes(AppRoutesNames.introScreen);
    DispatchProCustomerStorage.cleanData();
    HelperFunctions.displayToastMessage(
        'Sign-Out Sueeced fully', ToastificationType.success);
  }

  Future<bool> isAccessTokenValid() async {
    final accessToken =
        await DispatchProCustomerStorage.getValue(DataConstants.BearerToken);
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=$accessToken'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data.containsKey("expires_in") && data["expires_in"] > 0;
    } else {
      return false;
    }
  }

  Future<void> checkOrRefreshgoogleAccessToken() async {
    final isValid = await isAccessTokenValid();
    if (!isValid) {
      GoogleSignInAccount? googleUser = await googleSignIn.signInSilently();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      await DispatchProCustomerStorage.setValue(DataConstants.BearerToken, googleAuth.accessToken ?? '');
      print(googleAuth.accessToken);
      AppNavigation.pushReplacementTo(AppRoutesNames.mainScreen);
    } else {
      AppNavigation.pushReplacementTo(AppRoutesNames.mainScreen);
    }
  }
}
