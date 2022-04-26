import 'package:igreja_app/Models/User/user.dart';
import 'package:igreja_app/Repository/user_repository.dart';

class UserService {
  Future<User> createUser(User user) {
    UserRepository userRepository = UserRepository();
    return userRepository.createUser(user);
  }
}
