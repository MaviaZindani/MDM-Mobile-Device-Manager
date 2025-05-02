import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceController {
  final platform = MethodChannel('speech_to_text');
  String _lastWords = "";
  String get lastWords => _lastWords;

  void setLastWord (String content){
    _lastWords = content;
  }

  bool _speechEnabled = false;
  bool get speechEnabled => _speechEnabled;

  void setSpeechEnabled (bool set){
    _speechEnabled = set;
  }

  final SpeechToText speechToText = SpeechToText();

  Rx<TextEditingController> textController = TextEditingController(
    text: "delete YouTube",
  ).obs;



  Future<void> startListening() async {
    try {
      final String result = await platform.invokeMethod('startListening');
        final newText = " ${result.toString()}";
        _lastWords = newText;
        textController.value.text = "${textController.value.text} $_lastWords";
    } on PlatformException catch (e) {
        _lastWords = "Failed to recognize: '${e.message}'.";
    }
  }

  Future<void> stopListening() async {
  try {
    await platform.invokeMethod('stopListening');
  } on PlatformException catch (e) {
    print("Error stopping speech recognition: ${e.message}");
  }
}



  Future<void> requestForPermission() async {
    await Permission.microphone.request();
  }

   Future<void> listenForPermissions() async {
    final status = await Permission.microphone.status;
    switch (status) {
      case PermissionStatus.denied:
        requestForPermission();
        break;
      case PermissionStatus.granted:
        break;
      case PermissionStatus.limited:
        break;
      case PermissionStatus.permanentlyDenied:
        break;
      case PermissionStatus.restricted:
        break;
      case PermissionStatus.provisional:
        throw UnimplementedError();
    }
  }

  void dispose(){
    _lastWords = '';
    textController.value.clear();
  }
}
