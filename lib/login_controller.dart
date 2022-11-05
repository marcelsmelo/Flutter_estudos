import 'package:flutter/widgets.dart';
import 'package:login_provider_example/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  bool logged = false;
  late SharedPreferences _prefs;

  LoginController() {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    logged = _prefs.getBool('logged') ?? false;
    notifyListeners();
  }

  void login(Login data) async {
    if (data.username == "admin" && data.password == 'admin') {
      _prefs.setBool("logged", true);
      logged = true;
      notifyListeners();
    }
  }

  void logout() async {
    _prefs.setBool("logged", false);
    logged = false;
    notifyListeners();
  }
}
