import 'package:appoint_it/constrecter/data_const.dart';
import 'package:appoint_it/constrecter/design_const.dart';
import 'package:appoint_it/controllers/auth_controller.dart';
import 'package:appoint_it/routing/app_navigator.dart';
import 'package:appoint_it/routing/app_route_names.dart';
import 'package:appoint_it/utils/dispatchpro_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkIfUserExeceed () async{
    final Bearertoken = await DispatchProCustomerStorage.getValue(DataConstants.BearerToken);
    if(Bearertoken != null){
      return true;
    }else{
      return false;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    DispatchProCustomerStorage.initialize();
    Future.delayed(Duration(seconds: 3), () async{
      bool isUserExeceed = await checkIfUserExeceed();
      if (isUserExeceed) {
        AuthController authController = AuthController();
        await authController.checkOrRefreshgoogleAccessToken();
      }else{
        AppNavigation.pushReplacementTo(AppRoutesNames.introScreen);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignConstants.kPrimaryColor,
    );
  }
}