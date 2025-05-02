import 'package:appoint_it/controller_view/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventListeningField extends StatelessWidget {
  const EventListeningField({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.9,
      child: Obx(
        () => AnimatedOpacity(
          opacity: Get.find<MainScreenController>().fieldOpacity.value,
          duration: Duration(milliseconds: 700),
          child: TextField(
            readOnly: Get.find<MainScreenController>().voiceController.textController.value.text.isEmpty ? true : false,
            keyboardType: TextInputType.text,
            minLines: 6,
            maxLines: 10,
            controller: Get.find<MainScreenController>()
                .voiceController
                .textController
                .value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.pink.shade300,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.pink.shade300,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.pink.shade300,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.pink.shade300,
                  ),
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
        ),
      ),
    );
  }
}
