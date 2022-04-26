import 'package:igreja_app/Models/User/user.dart';
import 'package:igreja_app/Repository/login_repository.dart';

class LoginService {
  Future<User?> login(User user) {
    LoginRepository loginRepository = LoginRepository();
    return loginRepository.login(user);
  }
}
