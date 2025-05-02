import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';
import 'package:appoint_it/utils/helper_functions.dart';

class AppManagerController {

  static const platform = MethodChannel('com.example.app/manager');

  Future<List<String>> _getInstalledApps() async {
    final List<dynamic> result =
        await platform.invokeMethod('getInstalledApps');
    return result.cast<String>();
  }

  Future<void> _uninstallApp(String appName) async {
    await platform.invokeMethod('uninstallApp', {'appName': appName});
  }

  Future<String> _gettingAppNameForDelete(String appName) async {
    List<String> apps = await _getInstalledApps();
    for (var app in apps) {
      if (app.toLowerCase() == appName.toLowerCase()) {
        return app;
      }
    }
    HelperFunctions.displayToastMessage(
        "No app name found", ToastificationType.error);
    return "";
  }

  Future<void> createEvent(String appName) async {
    try {
      final deletingAppName = await _gettingAppNameForDelete(appName);
      print(deletingAppName);
      await _uninstallApp(deletingAppName);
    } catch (e) {
      rethrow;
    }
  }
}
