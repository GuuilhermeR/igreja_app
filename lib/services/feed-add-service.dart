import 'package:flutter/cupertino.dart';
import 'package:igreja_app/models/user/user.dart';

class FeedAddService {
  Future<User> createInfo(User user, BuildContext context) {
    FeedAddService userRepository = FeedAddService();
    return userRepository.createInfo(user, context);
  }

  Future<User> deleteInfo(User user, BuildContext context) {
    FeedAddService userRepository = FeedAddService();
    return userRepository.createInfo(user, context);
  }

  Future<User> updateInfo(User user, BuildContext context) {
    FeedAddService userRepository = FeedAddService();
    return userRepository.createInfo(user, context);
  }
}
