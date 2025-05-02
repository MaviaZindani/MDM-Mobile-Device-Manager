
class InAppAccessToken {
  String type = '';
  String data = '';
  DateTime? expiry;

  InAppAccessToken({
    this.data = '',
    this.expiry,
    this. type = ''
  });

  @override
  String toString() {
    return 'AccessToken(type=$type, data=$data, expiry=$expiry)';
  }

  // Factory constructor to parse from string
  factory InAppAccessToken.fromString(String str) {
    final typeRegex = RegExp(r'type=(.*?),');
    final dataRegex = RegExp(r'data=(.*?),');
    final expiryRegex = RegExp(r'expiry=(.*?)\)?$');

    final typeMatch = typeRegex.firstMatch(str);
    final dataMatch = dataRegex.firstMatch(str);
    final expiryMatch = expiryRegex.firstMatch(str);

    if (typeMatch == null || dataMatch == null || expiryMatch == null) {
      throw FormatException('Invalid AccessToken format');
    }

    return InAppAccessToken(
      type: typeMatch.group(1)!.trim(),
      data: dataMatch.group(1)!.trim(),
      expiry: DateTime.parse(expiryMatch.group(1)!.trim()),
    );
  }
}