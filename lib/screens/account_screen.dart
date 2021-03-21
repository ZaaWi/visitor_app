import 'package:flutter/material.dart';
import 'package:visitor_app/screens/components/animations/fade_animation.dart';

import 'components/account/account_menu.dart';
import 'components/account/profile_pic.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          FadeAnimation(
            1.6,
            AccountMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
          ),
          FadeAnimation(
            1.4,
            AccountMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
          ),
          FadeAnimation(
            1.2,
            AccountMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
          ),
          FadeAnimation(
            1.0,
            AccountMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
          ),
          FadeAnimation(
            0.8,
            AccountMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
