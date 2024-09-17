import 'SharedPreferencesProvider.dart';

class AppSharedPreferences {
  static SharedPreferencesProvider? sharedPreferencesProvider;
  static init() async {
    sharedPreferencesProvider = await SharedPreferencesProvider.getInstance();
  }

  //token
  static String get getToken => sharedPreferencesProvider!.read('token') ?? '';
  static saveToken(String value) =>
      sharedPreferencesProvider!.save('token', value);
  static bool get hasToken => sharedPreferencesProvider!.contains('token');
  static removeToken() => sharedPreferencesProvider!.remove('token');

  //lang

    static String get getLang => sharedPreferencesProvider!.read('language')??"en" ;
  static saveLang(String value) =>
      sharedPreferencesProvider!.save('language', value);
  static bool get hasLang => sharedPreferencesProvider!.contains('language');
  static removeLang() => sharedPreferencesProvider!.remove('language');

  // preference

  //theme
  // static bool get getDarkTheme => sharedPreferencesProvider!.read(AppStrings.darkTheme) ??  false ;
  // static saveDarkTheme(bool value) => sharedPreferencesProvider!.save(AppStrings.darkTheme, value);
  // static bool get hasDarkTheme => sharedPreferencesProvider!.contains(AppStrings.darkTheme);
  // static removeDarkTheme() => sharedPreferencesProvider!.remove(AppStrings.darkTheme);
}
