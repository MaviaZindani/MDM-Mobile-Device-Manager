
class AppImages {
  static const assetImagePath = 'assets/images/';
  static const assetLottiesPath = 'assets/lotties/';
  static const iconsPath = 'assets/icons/';

  static String _concatPathAndImage(String icon, {String? path}) {
    return path == null ? assetImagePath + icon : path + icon;
  }

  static String _concatPathAndLottie(String icon, {String? path}) {
    return path == null ? assetLottiesPath + icon : path + icon;
  }
  // temporary image
  static final introTemporaryImage = _concatPathAndImage("intro_temporary_image.svg");

  // AppIcons
  static final applogo = _concatPathAndImage("app_logo.svg");
  static final imagePlaceHolderIcon = _concatPathAndImage("image_placeholder.svg");

  // reuseable icon/images
  static final carImage = _concatPathAndImage("car_image.png");
  static final profieImage = _concatPathAndImage("profile_image.png");
  static final copyIconImage = _concatPathAndImage("copy_icon_image.svg");
  static final infoIconIamge = _concatPathAndImage("info_icon_image.svg");
  static final chatIconImage = _concatPathAndImage("chat_icon_image.svg");
  static final muteIconImage = _concatPathAndImage("mute_icon_image.svg");
  static final dayThemeImage = _concatPathAndImage("day_theme_image.svg");
  static final callBackground = _concatPathAndImage("call_background.svg");
  static final appleIconImage = _concatPathAndImage("apple_icon_image.svg");
  static final phoneIconImage = _concatPathAndImage("phone_icon_image.svg");
  static final topUpIconImage = _concatPathAndImage("top_up_image_icon.svg");
  static final nightThemeImage = _concatPathAndImage("night_theme_image.svg");
  static final googleIconImage = _concatPathAndImage("google_icon_image.svg");
  static final spakerIconImage = _concatPathAndImage("spaker_icon_image.svg");
  static final balanceIconImage = _concatPathAndImage("balance_icon_image.svg");
  static final sueecedImageIcon = _concatPathAndImage("sueeced_image_icon.svg");
  static final endCallIconImage = _concatPathAndImage("end_call_icon_image.svg");
  static final paymenCardMethod = _concatPathAndImage("payment_card_method.svg");
  static final locationDialogImage = _concatPathAndImage("location_dialog_image.svg");
  static final deleteLocationDilog = _concatPathAndImage("delete_location_dilog.svg");
  static final cashOptionIconImage = _concatPathAndImage("cash_option_icon_image.svg");
  static final extraStopsIconImage = _concatPathAndImage("extra_stops_icon_image.svg");
  static final cardOptionIconImage = _concatPathAndImage("card_option_icon_image.svg");
  static final topUpwhiteIconImage = _concatPathAndImage("top_up_white_icon_image.svg");
  static final reusableBottomDesign = _concatPathAndImage("reusable_bottom_design.svg");
  static final temporyCardIconImage = _concatPathAndImage("tempory_card_icon_image.svg");
  static final addCommentsIconIamge = _concatPathAndImage("add_comments_icon_image.svg");
  static final sendMessageIconImage = _concatPathAndImage("send_message_icon_image.svg");
  static final purplePhoneIconImage = _concatPathAndImage("purple_phone_icon_image.svg");
  static final completeRideIconImage = _concatPathAndImage("complete_ride_icon_image.svg");
  static final paymentOptionIconIamge = _concatPathAndImage("payment_option_icon_image.png");
  static final refundPaymentIconImage = _concatPathAndImage("refund_payment_icon_image.svg");
  static final shareLocationIconImage = _concatPathAndImage("share_location_icon_image.svg");
  static final greenLocationIconImage = _concatPathAndImage("green_location_icon_image.svg");
  static final pickupLocationIconImage = _concatPathAndImage("pickup_location_icon_image.svg");
  static final deleteAccountButtonImage = _concatPathAndImage("delete_account_button_image.svg");
  static final settingChangeThemeIconIamge = _concatPathAndImage("setting_change_theme_icon_image.svg");
  static final settingTermsOfUsageIconIamge = _concatPathAndImage("setting_termsofusage_icon_image.svg");
  static final settingPrivacyPolicyIconIamge = _concatPathAndImage("setting_privacypolicy_icon_image.svg");
  static final settingChangeLanguageIconIamge = _concatPathAndImage("setting_change_language_icon_image.svg");
  static final settingChangeThemeWhiteIconIamge = _concatPathAndImage("setting_change_theme_white_icon_image.svg");
  static final settingChangeAppsettingsIconIamge = _concatPathAndImage("setting_change_appsettings_icon_image.svg");
  static final settingTermsOfUsageWhiteIconIamge = _concatPathAndImage("setting_termsofusage_white_icon_image.svg");
  static final settingChangePhoneNumberIconIamge = _concatPathAndImage("setting_change_phone_number_icon_image.svg");
  static final settingPrivacyPolicyWhiteIconIamge = _concatPathAndImage("setting_privacypolicy_white_icon_image.svg");
  static final settingChangeLanguageWhiteIconIamge = _concatPathAndImage("setting_change_language_white_icon_image.svg");
  static final settingChangeAppsettingsWhiteIconIamge = _concatPathAndImage("setting_change_appsettings_white_icon_image.svg");
  static final settingChangePhoneNumberWhiteIconIamge = _concatPathAndImage("setting_change_phone_number_white_icon_image.svg");
  static final taxiIconImage = _concatPathAndImage("taxi_icon.png");
  static final personIconImg = _concatPathAndImage("man.png");
  static final carHorizontalIcon = _concatPathAndImage("car_horizontal_icon.png");
  static final carVerticalIcon = _concatPathAndImage("car_vertical_icon.png");
  static final menuIcon = _concatPathAndImage("menu_icon.svg");


  // city flags
  static final uaeFlag = _concatPathAndImage("uae_flag.png");

  // Splash Screen images
  static final splashBottomDesign = _concatPathAndImage("splash_bottom_design.svg");

  // auth
  static final otpScreenImage = _concatPathAndImage("otp_screen_image.svg");
  static final phoneLoginScreenImage = _concatPathAndImage("phone_login_screen_image.svg");

  
  // other screen
  static final locationPermissionImage = _concatPathAndImage("location_permission_image.svg");

  // drawer images
  static final drawerHistoryIconImage = _concatPathAndImage("drawer_history_icon_image.svg");
  static final drawerSettingsIconImage = _concatPathAndImage("drawer_settings_icon_image.svg");
  static final drawerPaymentIconImage = _concatPathAndImage("drawer_payment_icon_image.svg");
  static final drawerProfileIconImage = _concatPathAndImage("drawer_profile_icon_image.svg");
  static final drawerSupportIconImage = _concatPathAndImage("drawer_support_icon_image.svg");
  static final drawerFavoritesIconImage = _concatPathAndImage("drawer_favorites_icon_image.svg");
  static final drawerNotificationIconImage = _concatPathAndImage("drawer_notification_icon_image.svg");
  static final drawerFututeBookingIconImage = _concatPathAndImage("drawer_futute_booking_icon_image.svg");
  static final drawerWalletIconImage = _concatPathAndImage("drawer_wallet_icon_image.svg");

  static final drawerEmergencyCallIconImage = _concatPathAndImage("drawer_emergency_call_icon_image.svg");



  // lotties
  static final logoutLottie = _concatPathAndLottie("logout_lottie.json");
  static final splashLottie = _concatPathAndLottie("splash_lottie.json");
  static final notStartChatLottie = _concatPathAndLottie("not_start_chat.json");
  static final cancleRideLottie = _concatPathAndLottie("cancel_ride_lottie.json");
  static final scheduleLottie = _concatPathAndLottie("time_schedule_lottie.json");
  static final termsOfUseLottie = _concatPathAndLottie("terms_of_use_lottie.json");
  static final emptyHistoryLottie = _concatPathAndLottie("no_history_lottie.json");
  static final changeThemeLottie = _concatPathAndLottie("change_theme_lottie.json");
  static final noCardFoundLottie = _concatPathAndLottie("no_card_found_lottie.json");
  static final arrivedAtPickupLottie = _concatPathAndLottie("arrived_at_pickup.json");
  static final timeScheduleLottie = _concatPathAndLottie("time_schedule_lottie.json");
  static final futureBookingLottie = _concatPathAndLottie("future_booking_lottie.json");
  static final deleteAccountLottie = _concatPathAndLottie("delete_account_lottie.json");
  static final privacyPolicyLottie = _concatPathAndLottie("privacy_policy_lottie.json");
  static final reachedAtDropOffLottie = _concatPathAndLottie("reached_at_drop_off.json");
  static final changeLanguageLottie = _concatPathAndLottie("change_language_lottie.json");
  static final changeAppSettingsLottie = _concatPathAndLottie("change_app_settings_lottie.json");
  static final changePhoneNumberLottie = _concatPathAndLottie("change_phone_number_lottie.json");
  static final findingRideLoadingLottie = _concatPathAndLottie("finding_ride_loading_lottie.json");
  static final emptyNotificationBoxLottie = _concatPathAndLottie("empty_notification_box_lottie.json");
  static final loadingLottie = _concatPathAndLottie("loading_lottie.json");
  static final noFavouritesLottie = _concatPathAndLottie("no_favourites.json");


  //emojis
  static final selectedBadEmoji = _concatPathAndImage("selected_bad_emoji.png");
  static final selectedGoodEmoji = _concatPathAndImage("selected_good_emoji.png");
  static final selectedGreatEmoji = _concatPathAndImage("selected_great_emoji.png");
  static final unSelectedBadEmoji = _concatPathAndImage("unselected_bad_emoji.png");
  static final unSelectedGoodEmoji = _concatPathAndImage("unselected_good_emoji.png");
  static final unSelectedGreatEmoji = _concatPathAndImage("unselected_great_emoji.png");
  static final selectedExcellentEmoji = _concatPathAndImage("selected_excellent_emoji.png");
  static final unSelectedExcellentEmoji = _concatPathAndImage("unselected_excellent_emoji.png");


  // notification images
  static final rideCompletedNotifiIconImage = _concatPathAndImage("ride_completed_notifi_icon_image.svg");
  static final rideCancelledNotifiIconImage = _concatPathAndImage("ride_cancelled_notifi_icon_image.svg");
  static final bookingScheduledNotifiIconImage = _concatPathAndImage("booking_scheduled_notifi_icon_image.svg");



}
