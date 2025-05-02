import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:appoint_it/constrecter/design_const.dart';
import 'package:appoint_it/enums/Event_creating_state.dart';
import 'package:appoint_it/controller_view/main_screen_controller.dart';

class FloatButton extends StatefulWidget {
  const FloatButton({super.key});

  @override
  State<FloatButton> createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late MainScreenController _mainScreenController;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _mainScreenController = Get.find<MainScreenController>();
  }

  Future<void> _startAnimation() async {
        _isListening = true;
        _animationController.repeat(reverse: true);
        _animationController.forward();
  }

  Future<void> _stopAnimation() async {
    setState(() {
      _isListening = false;
      _animationController.repeat(reverse: false);
      _animationController.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _mainScreenController
            .startListeningEventAction(EventCreatingState.creating);
      },
      onLongPressStart: (details) {
        _startAnimation();
        _mainScreenController
            .startListeningEventAction(EventCreatingState.micOn);
        // _toggleListening();
      },
      onLongPressEnd: (details) {
        Future.delayed(Duration(seconds: 2), () {
          if (Get.find<MainScreenController>()
              .voiceController
              .textController
              .value
              .text
              .isNotEmpty) {
            _mainScreenController
                .startListeningEventAction(EventCreatingState.create);
          } else {
            _mainScreenController
                .startListeningEventAction(EventCreatingState.micOff);
          }
        _stopAnimation();
        });
      },
      child: ScaleTransition(
        scale: _animation,
        
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isListening ? Colors.red : DesignConstants.K2PrimaryColor,
          ),
          child: Obx(() {
            MainScreenController viewController = Get.find();
            switch (viewController.currentEventStatus.value) {
              case EventCreatingState.micOn:
                return Icon(
                  Icons.mic,
                  color: Colors.white,
                  size: 30,
                );
        
              case EventCreatingState.creating:
                return CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  backgroundColor: DesignConstants.K2PrimaryColor,
                  color: DesignConstants.kWhiteColor,
                );
        
              case EventCreatingState.create:
                return Icon(Icons.event, color: Colors.white, size: 30);
        
              default:
                return Icon(
                  Icons.mic_off,
                  color: Colors.white,
                  size: 30,
                );
            }
          }),
        ),
      ),
    );
  }
}
