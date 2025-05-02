import 'dart:convert';

import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:appoint_it/utils/helper_functions.dart';
import 'package:appoint_it/enums/Event_creating_state.dart';
import 'package:appoint_it/controllers/voice_controller.dart';
import 'package:appoint_it/controllers/gimini_controller.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:appoint_it/controllers/app_manage_controller.dart';
import 'package:appoint_it/controllers/event_creater_controller.dart';

class MainScreenController extends GetxController {
  Rx<EventCreatingState> currentEventStatus = EventCreatingState.micOff.obs;
  bool isActionProcessing = false;
  bool _isListening = false;
  bool get isListening => _isListening;
  VoiceController voiceController = VoiceController();
  RxDouble fieldOpacity = 0.0.obs;

  Future<void> initSpeech() async {
    final initSpeech = await voiceController.speechToText.initialize();
    voiceController.setSpeechEnabled(initSpeech);
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    print(result);
    voiceController
        .setLastWord("${voiceController.lastWords}${result.recognizedWords}");
    print(voiceController.lastWords);
    voiceController.textController.value.text = voiceController.lastWords;
    update();
  }

  startlisteningEventFieldVisibility() {
    voiceController.textController.update((model) {
      if (model!.text.isEmpty) {
        fieldOpacity.value = 0.0;
        voiceController.setLastWord('');
        voiceController.textController.value.clear();
        currentEventStatus.value = EventCreatingState.micOff;
      }
      if (model.text.isNotEmpty) {
        fieldOpacity.value = 1.0;
      }
    update();
    });
  }

  RxBool isLoading = false.obs;
  RxDouble initAnimationOpacity = 0.0.obs;
  RxBool isInitAnimationStart = false.obs;
  GiminiController giminiController = GiminiController();
  AppManagerController appManagerController = AppManagerController();
  EventCreaterController eventCreaterController = EventCreaterController();

  Future<void> _taskAssigner(String prompt) async{
    final jsonFormeted = await giminiController.AIgenereteJson(prompt);
    final formatedtext = jsonDecode(jsonFormeted);
    
    if (formatedtext['forDeleteApp'] is bool && formatedtext['forDeleteApp'] == true) {
      print(formatedtext['applicationData']['applicationName']);
      appManagerController.createEvent(formatedtext['applicationData']['applicationName'].toString());
    }

    if (formatedtext['forCalander'] is bool && formatedtext['forCalander'] == true) {
      eventCreaterController.createEvent(jsonFormeted: formatedtext['calanderData']);
    }
  }


  startListeningEventAction(EventCreatingState status) async {
    // if task is has null value so function will return
    if (isActionProcessing) return;
    
    if (voiceController.textController.value.text == ''){
      HelperFunctions.displayToastMessage('Hold to speck for perform event or task', ToastificationType.info);
      return;
    };

    isActionProcessing = true;
    print("isActionProcessing true");
    currentEventStatus.value = status;
    try {
      switch (currentEventStatus.value) {
        case EventCreatingState.micOff:
          print("stop listening");
          // await voiceController.speechToText.stop();
          voiceController.stopListening();
          update();
          break;
        case EventCreatingState.creating:
          print("creating");
          final _prompt = voiceController.textController.value.text;
        
            isActionProcessing = true;
            isLoading = true.obs;
            currentEventStatus.value = EventCreatingState.creating;
            try {
              await _taskAssigner(_prompt);
              voiceController.dispose();
            } catch (e) {
              print("error in main screen controller create event {$e}");
            } finally {
              isLoading = false.obs;
              currentEventStatus.value = EventCreatingState.micOff;
              Future.delayed(Duration(milliseconds: 500), () {
                isActionProcessing = false;
              });
            }

          isInitAnimationStart.value = false;
          break;
        case EventCreatingState.create:
          print("creat");
          break;
        default:
          print("start listening");
          isInitAnimationStart.value = false;
          await voiceController.startListening();
          currentEventStatus.value = EventCreatingState.micOff;
          if (!voiceController.speechToText.isAvailable) {
            print("Speech recognition is not available");
            return;
          }

          if (voiceController.speechToText.isListening) {
            print("Already listening...");
            return;
          }

          bool available = await voiceController.speechToText.initialize();
          if (!available) {
            print("Speech recognition failed to initialize");
            return;
          }

          print(voiceController.speechToText.isAvailable);
          isInitAnimationStart.value = false;
          currentEventStatus.value = EventCreatingState.micOn;
          await voiceController.speechToText.listen(
            onResult: onSpeechResult,
            // listenFor: const Duration(seconds: 2),
            // localeId: "en_US",
            cancelOnError: false,
            partialResults: false,
            listenMode: ListenMode.deviceDefault,
          );
          print("Listening started...");
          currentEventStatus.value = EventCreatingState.micOff;
          update();
          isInitAnimationStart.value = false;
          break;
      }
    } catch (e) {
      print("error $e");
    } finally {
      print("isActionProcessing false");
      Future.delayed(Duration(milliseconds: 500), () {
        isActionProcessing = false;
      });
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await voiceController.requestForPermission();
    voiceController.listenForPermissions();
    if (!voiceController.speechEnabled) {
      await initSpeech();
    }

    ever(currentEventStatus, (_) => startListeningEventAction(EventCreatingState.micOff));
    ever(isInitAnimationStart, (object) {
      if (object) {
        Future.delayed(Duration(milliseconds: 500), () {
          initAnimationOpacity.value = 1.0;
          update();
        });
      } else {
        initAnimationOpacity.value = 0.0;
        isInitAnimationStart.value = false;
        update();
      }
    });
    voiceController.textController.value
        .addListener(startlisteningEventFieldVisibility);
    isInitAnimationStart.value = true;
    super.onInit();
  }
}
