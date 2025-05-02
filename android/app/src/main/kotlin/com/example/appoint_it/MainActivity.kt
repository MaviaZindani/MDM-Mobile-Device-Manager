package com.example.appoint_it

import android.net.Uri
import android.os.Bundle
import android.content.Intent
import android.speech.RecognizerIntent
import android.speech.SpeechRecognizer
import android.content.pm.PackageManager
import android.speech.RecognitionListener
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import android.util.Log

class MainActivity : FlutterActivity() {
    private val CHANNEL1 = "speech_to_text"
    private val CHANNEL2 = "com.example.app/manager"
    private var speechRecognizer: SpeechRecognizer? = null
    private var pendingResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL1).setMethodCallHandler { call, result ->
            when (call.method) {
                "startListening" -> startListening(result)
                "stopListening" -> stopListening(result)
                else -> result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL2).setMethodCallHandler { call, result ->
            when (call.method) {
                "getInstalledApps" -> {
                    val pm = applicationContext.packageManager
                    val apps = pm.getInstalledApplications(PackageManager.GET_META_DATA)
                        .filter { pm.getLaunchIntentForPackage(it.packageName) != null }
                        .map { it.loadLabel(pm).toString() }
                    result.success(apps)
                }

                "uninstallApp" -> {

                    
                        val packageName = call.argument<String>("packageName")
                        val intent = Intent(Intent.ACTION_DELETE)
                        intent.data = Uri.parse("package:$packageName")
                        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                        startActivity(intent)
                        result.success(null)
                    

                    // val appName = call.argument<String>("appName")
                    // val pm = applicationContext.packageManager
                    // val apps = pm.getInstalledApplications(PackageManager.GET_META_DATA)
                    // val matchedApp = apps.find { it.loadLabel(pm).toString().equals(appName, ignoreCase = true) }

                    // if (matchedApp != null) {
                    //     val intent = Intent(Intent.ACTION_DELETE)
                    //     intent.data = Uri.parse("package:${matchedApp.packageName}")
                    //     intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                    //     startActivity(intent)
                    //     result.success(null)
                    // } else {
                    //     result.error("APP_NOT_FOUND", "Application not found", null)
                    // }
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun startListening(result: MethodChannel.Result) {
        if (!SpeechRecognizer.isRecognitionAvailable(this)) {
            result.error("NOT_AVAILABLE", "Speech recognition not available", null)
            return
        }

        // Prevent duplicate requests
        if (pendingResult != null) {
            result.error("IN_PROGRESS", "Recognition already in progress", null)
            return
        }

        speechRecognizer = SpeechRecognizer.createSpeechRecognizer(this)
        pendingResult = result

        val intent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH).apply {
            putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
            putExtra(RecognizerIntent.EXTRA_LANGUAGE, "en-US")
        }

        speechRecognizer!!.setRecognitionListener(object : RecognitionListener {
            override fun onResults(results: Bundle?) {
                val matches = results?.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION)
                if (!matches.isNullOrEmpty()) {
                    pendingResult?.success(matches[0])
                } else {
                    pendingResult?.error("NO_MATCHES", "No speech recognized", null)
                }
                pendingResult = null
            }

            override fun onError(error: Int) {
                pendingResult?.error("ERROR", "Speech recognition failed with code: $error", null)
                pendingResult = null
            }

            override fun onReadyForSpeech(params: Bundle?) {}
            override fun onBeginningOfSpeech() {}
            override fun onRmsChanged(rmsdB: Float) {}
            override fun onBufferReceived(buffer: ByteArray?) {}
            override fun onEndOfSpeech() {}
            override fun onPartialResults(partialResults: Bundle?) {}
            override fun onEvent(eventType: Int, params: Bundle?) {}
        })

        speechRecognizer!!.startListening(intent)
    }

    private fun stopListening(result: MethodChannel.Result) {
        speechRecognizer?.stopListening()
        result.success("Stopped listening")
    }

    override fun onDestroy() {
        super.onDestroy()
        speechRecognizer?.destroy()
        pendingResult = null
    }
}
