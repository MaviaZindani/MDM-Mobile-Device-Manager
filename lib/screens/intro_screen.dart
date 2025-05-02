import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late AuthController authController;
  @override
  void initState() {
    // TODO: implement initState
    authController = AuthController();
    GoogleSignIn.standard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(),
              flex: 2,
            ),
            SizedBox(
                child: Image.asset(
              "assets/images/icons8-google-calendar-256.png",
              fit: BoxFit.fill,
            )),
            Expanded(
              child: SizedBox(),
              flex: 2,
            ),
            GestureDetector(
              onTap: () async {
                await authController.signIn();
              },
              child: Container(
                width: width * 0.8,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xff9E5DE8),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Sign-In with google',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
