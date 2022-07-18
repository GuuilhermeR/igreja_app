import 'package:flutter/widgets.dart';
import 'package:igreja_app/models/user/user.dart';

class UserState extends ChangeNotifier {
  bool isInLogin = false;
  void changeLoginState(bool isLoggin) {
    isInLogin = isLoggin;
    notifyListeners();
  }

  User loggedUser = User("", "");
  void setUser(User user) {
    loggedUser = user;
  }
}
