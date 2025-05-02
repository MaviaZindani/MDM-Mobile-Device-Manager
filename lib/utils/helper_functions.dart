import 'package:appoint_it/model/access_token.dart';
import 'package:appoint_it/routing/app_navigator.dart';
import 'package:flutter/widgets.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:toastification/toastification.dart';

class BottomSheetsAndDialogs {
}

class HelperFunctions {
  // Toast Message
static List<String> activeToasts = [];

static void displayToastMessage(
  String message,
  ToastificationType notificationType, {
  ToastificationStyle notificationStyle = ToastificationStyle.fillColored,
  Duration duration = const Duration(milliseconds: 10000),
}) {
  if (activeToasts.length >= 2) {
    return; // Prevent more than 2 messages from showing
  }

  activeToasts.add(message);

  toastification.show(
    context: AppNavigation.navigatorKey.currentContext,
    title: Text(
      message,
      softWrap: true,
      maxLines: null,
      overflow: TextOverflow.visible,
    ),
    type: notificationType,
    style: notificationStyle,
    alignment: Alignment.topCenter,
    autoCloseDuration: duration,
    animationDuration: const Duration(milliseconds: 400),
    showProgressBar: true,
    closeOnClick: true,
  );

  // Remove the message from activeToasts after the duration
  Future.delayed(duration, () {
    activeToasts.remove(message);
  });
}

// turning text in to token
static InAppAccessToken turnTextIntoToken({required String rowToken}){
  InAppAccessToken token = InAppAccessToken.fromString(rowToken);
  return token;
}
}
