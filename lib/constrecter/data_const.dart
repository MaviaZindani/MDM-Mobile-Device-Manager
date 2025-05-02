import 'package:flutter/material.dart';

class DataConstants {
  static const imagePath = 'assets/images/';

// padding
  static const double kScreenBottomPadding = 8;
  static const double kScreenHorizontalPadding = 16;
  static const double kScreenVerticalPadding = 10;

// text
  static const double kLowTextSize = 16;
  static const double kNormalTextSize = 18;
  static const double kHighTextSize = 22;

// Icons Sizes
  static const double kLowIconSize = 18;
  static const double kNormalIconSize = 22;
  static const double kHighIconSize = 26;

// Border
  static const double kBorderlowThickness = 0.9;
  static const double kBorderNormalThickness = 1.2;
  static const double kBorderHighThickness = 1;
  static const double kNormalBorderRadius = 18;
  static const double kHighBorderRadius = 12;
  static const double kAcceptDeclineBorederRadius = 8;

  static GlobalKey<ScaffoldState> scaffoldKeyForSideBarMenu =
      GlobalKey<ScaffoldState>();
  static const String BearerToken = "BreareToken";
  static const String clientId =
      "583879317963-ss8t1a3gom351qps6lvuq6s0gfler2fq.apps.googleusercontent.com";
  static const String serverClintId =
      "583879317963-36h7b3pvj64g2dg8tso1k340ucahtbqk.apps.googleusercontent.com";
  static const String KGeminiKey = "AIzaSyA6S6r_2JXm4dY8cq8jlSh13L2oYDnsDtw";
  static const String kprimeryCalanderId = "PrimyCalanderId";

// Scops
  static const List<String> iosScopes = [
    'openid',
    'email',
    'profile',
    'https://www.googleapis.com/auth/calendar.events',
    'https://www.googleapis.com/auth/calendar.readonly'
  ];
  static const List<String> androidScopes = [
    'openid',
    'email',
    'profile',
    'https://www.googleapis.com/auth/calendar.events',
    'https://www.googleapis.com/auth/calendar.readonly'
  ];

  static String kEventCreatingSystemInstruction =
      """You are an AI that converts user prompts into structured JSON. Based on the user's request, respond in one of the following formats:

1. **If the prompt (in English, Urdu, or Hindi) asks to delete a mobile application**, return:
{
  "forDeleteApp": true,
  "applicationData":
  {
    "applicationName": "application name"
  }
}

2. **Otherwise**, return a Google Calendar event in this format:
{
  "forCalander": true,
  "calanderData": 
  {
    "summary": "Event Title",
    "start": {
      "dateTime": "YYYY-MM-DDTHH:MM:SS",
      "timeZone": "Region/City"
    },
    "end": {
      "dateTime": "YYYY-MM-DDTHH:MM:SS",
      "timeZone": "Region/City"
    },
    "colorId": "X"
  \}
}

Guidelines for Calendar Events:
- Use this as the current date: ${DateTime.now().toString()}.
- Detect the language of the input: English, Urdu, or Hindi.
- Transliterate Urdu or Hindi to English (if possible). If not possible, return the text as-is.
- If the input contains “tomorrow” (کل, कल), interpret as: ${DateTime.now().add(Duration(hours: 24)).toString()}
- If the input contains “yesterday” (گزشتہ, कल), interpret as: ${DateTime.now().subtract(Duration(hours: 24)).toString()}
- If no time is given, assume current time and set a 10-minute duration.
- If no date is given, assume today.
- If year/month is missing, use values from ${DateTime.now()}
- If provided date is in the past, assume next valid future occurrence.
- Default timezone: "Asia/Karachi".
- Default colorId: "8" unless user mentions a known color.
- Use the following color name to ID mapping:

| Color ID | Color Name |
|----------|------------|
| 1  | brown     |
| 2  | red       |
| 3  | orange    |
| 4  | darkOrange|
| 5  | deepOrange|
| 6  | amber     |
| 7  | green     |
| 8  | darkGreen |
| 9  | lime      |
| 10 | yellow    |
| 11 | golden    |
| 12 | brightYellow |
| 13 | teal      |
| 14 | lightBlue |
| 15 | blue      |
| 16 | indigo    |

Special Case (Mobile App Deletion):
If the prompt clearly asks to delete or uninstall a mobile app (in Urdu, Hindi, or English), return:
{
  "forDeleteApp": true,
  "applicationName": "App Name"
}

Examples:
- "Delete TikTok from my mobile"
→ { "forDeleteApp": true, "applicationName": "TikTok" }

- "کل دوپہر میٹنگ رکھیں"
→ { "forCalander": true, ... }

Use `generateContent([Content.text(prompt)])` and return the **entire valid JSON output** accordingly.
""";
}
