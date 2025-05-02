class CalanderListModel {
  String kind = '';
  String etag = '';
  String nextSyncToken = '';
  List<Items> items = [];

  CalanderListModel();

  CalanderListModel.fromJson(Map<String, dynamic> json) {
    if (json['kind'] is String) {
      kind = json['kind'];
    }
    if (json['etag'] is String) {
      etag = json['etag'];
    }
    if (json['nextSyncToken'] is String) {
      nextSyncToken = json['nextSyncToken'];
    }
    if (json['items'] is List) {
      items =
          (json['items'] as List).map((item) => Items.fromJson(item)).toList();
    }
  }
}

class Items {
  String kind = '';
  String etag = '';
  String id = '';
  String summary = '';
  String timeZone = '';
  String colorId = '';
  String backgroundColor = '';
  String foregroundColor = '';
  bool selected = false;
  String accessRole = '';
  bool primary = false;
  List<DefaultReminder> defaultReminders = [];
  NotificationSetting notificationStttings = NotificationSetting();
  ConferenceProperties conferenceProperties = ConferenceProperties();

  Items();

  Items.fromJson(Map<String, dynamic> json) {
    if (json['kind'] is String) {
      kind = json['kind'];
    }
    if (json['etag'] is String) {
      etag = json['etag'];
    }
    if (json['id'] is String) {
      id = json['id'];
    }
    if (json['summary'] is String) {
      summary = json['summary'];
    }
    if (json['timeZone'] is String) {
      timeZone = json['timeZone'];
    }
    if (json['colorId'] is String) {
      colorId = json['colorId'];
    }
    if (json['backgroundColor'] is String) {
      backgroundColor = json['backgroundColor'];
    }
    if (json['foregroundColor'] is String) {
      foregroundColor = json['foregroundColor'];
    }
    if (json['selected'] is bool) {
      selected = json['selected'];
    }
    if (json['primary'] is bool) {
      primary = json['primary'];
    }
    if (json['accessRole'] is String) {
      accessRole = json['accessRole'];
    }
    if (json['defaultReminders'] is List) {
      defaultReminders = (json['defaultReminders'] as List).map((item) => DefaultReminder.fromJson(item)).toList();;
    }
    if (json['notificationStttings'] is Map) {
      notificationStttings = NotificationSetting.fromJson(json);
    }
    if (json['conferenceProperties'] != null) {
      conferenceProperties =
          ConferenceProperties.fromJson(json['conferenceProperties']);
    } else {
      conferenceProperties = ConferenceProperties();
    }
  }
}

class NotificationSetting {
  List<Notification> notifications = [];

  NotificationSetting();

  NotificationSetting.fromJson(Map<String, dynamic> json){
    if (json['notifications'] is List) {
      notifications = (json['notifications'] as List).map((item) => Notification.fromJson(item)).toList();
    }
  }
}

class Notification {
  String type = '';
  String method = '';

  Notification();

  Notification.fromJson(Map<String, dynamic> json) {
    if (json['type'] is String) {
      type = json['type'];
    }
    if (json['method'] is String) {
      method = json['method'];
    }
  }
}

class ConferenceProperties {
  List<String> allowedConferenceSolutionTypes = [];

  ConferenceProperties();

  ConferenceProperties.fromJson(Map<String, dynamic> json) {
    if (json['allowedConferenceSolutionTypes'] is List) {
      allowedConferenceSolutionTypes =
          json['allowedConferenceSolutionTypes'].cast<String>();
    }
  }
}

class DefaultReminder {
  String method = "";
  String minutes = "";

  DefaultReminder();

  DefaultReminder.fromJson(Map<String, dynamic> json){
    if (json['method'] is String) {
      method = json['method'];
    }
    if (json['minutes'] is String) {
      minutes = json['minutes'];
    }
  }
}
