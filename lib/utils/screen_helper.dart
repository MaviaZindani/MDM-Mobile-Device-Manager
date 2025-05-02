import 'package:appoint_it/constrecter/data_const.dart';
import 'package:flutter/material.dart';

class ScreenHelper {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }

  static double getScreenCompleteHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double getScreenWidthAfterPadding(BuildContext context) {
    return MediaQuery.sizeOf(context).width -
        (DataConstants.kScreenHorizontalPadding * 2);
  }
}
