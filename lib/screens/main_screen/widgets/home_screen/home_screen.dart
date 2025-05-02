import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appoint_it/constrecter/design_const.dart';
import 'package:appoint_it/controller_view/main_screen_controller.dart';
import 'package:appoint_it/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:appoint_it/screens/main_screen/widgets/home_screen/widgets/event_listening_field.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = ScreenHelper.getScreenWidth(context);
    double height = ScreenHelper.getScreenCompleteHeight(context);
    return Scaffold(
      backgroundColor: Color(0xffF8EAFF),
      body: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  switch (Get.find<MainScreenController>()
                      .isInitAnimationStart
                      .value) {
                    case true:
                      return AnimatedOpacity(
                        opacity: Get.find<MainScreenController>()
                            .initAnimationOpacity
                            .value,
                        duration: Duration(milliseconds: 700),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: width * 0.9,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: DesignConstants.K2PrimaryColor,
                                width: 2),
                          ),
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: DesignConstants.kDisabledColor,
                              fontFamily: 'Bobbers',
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                    'Hold the mic button to speak and create event or task... mark a birthday event for tommorrow at 3pm, it end 12pm'),
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                              onFinished: () {
                                Get.find<MainScreenController>()
                                    .isInitAnimationStart
                                    .value = false;
                              },
                            ),
                          ),
                        ),
                      );
                    default:
                      return EventListeningField();
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
