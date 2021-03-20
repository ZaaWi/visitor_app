import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visitor_app/api/api_config.dart';
import 'package:visitor_app/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User user;
  bool loggedIn = false;





  void setUserData(
      {int id,
      String userName,
      List<int> interests,
      List<int> wishlist,
      String token}) {
    user = User(
        id: id,
        userName: userName,
        interests: interests,
        wishlist: wishlist,
        token: token);
    notifyListeners();
  }








}
