class Settings {
  static Map<String, String> GlobalSettings = new Map();

  // Will override value if it is a duplicate
  static void SetSetting(String Key, String Value) {
    GlobalSettings.addAll({Key: Value});
  }

  static String GetSetting(String Key) {
    //GlobalSettings

    return "";
  }
}
