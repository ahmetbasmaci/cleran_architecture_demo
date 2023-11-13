abstract class ILangDataSource {
  String getSavedLang();
  Future<bool> updateLang(String lang);
  String getDefaultLang();
}
