import 'package:appoint_it/constrecter/data_const.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GiminiController {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: DataConstants.KGeminiKey,
    systemInstruction: Content.text(DataConstants.kEventCreatingSystemInstruction),
  );

   Future<String> AIgenereteJson(String prompt) async {
    GenerateContentResponse? response;
    try {
      response = await model.generateContent([Content.text(prompt)]);
      print(response.text);
    } catch (e) {
      print("error $e");
    }
    return response?.text?.replaceAll(RegExp(r"```|json"), '') ?? '';
  }
}