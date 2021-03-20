import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visitor_app/api/api_config.dart';
import 'package:visitor_app/providers/user_provider.dart';

import 'home_screen.dart';
import 'wishlist_screen.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  var testWidget = Scaffold(
    body: Center(
      child: Text('home'),
    ),
  );

  //State class
  Widget getNavBarPage(int index) {
    //home screen
    if (index == 0) {
      // return HomeScreen();
      return HomeScreen();
    } else
    //Wishlist screen
    if (index == 1) {
      // return Center(child: Text('wishlist'),);
      return WishlistScreen();
    } else
    //my tickets screen
    if (index == 2) {
      // return Center(child: Text('my tickets'),);
      return testWidget;
    }
    //account screen
    else
      // return Center(child: Text('Account'),);
      return testWidget;
  }

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(gqlUrl);
    String token = Provider.of<UserProvider>(context).user.token;

    final AuthLink auth =
        AuthLink(headerKey: 'Authorization', getToken: () => 'Bearer $token');
    final Link link = auth.concat(httpLink);

    final ValueNotifier<GraphQLClient> Client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );

    return GraphQLProvider(
      client: Client,
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            index: 0,
            height: 55,
            backgroundColor: Colors.transparent,
            color: Colors.lightBlueAccent,
            key: _bottomNavigationKey,
            items: <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.favorite, size: 30),
              Icon(Icons.confirmation_number, size: 30),
              Icon(Icons.account_circle, size: 30),
            ],
            onTap: (index) {
              setState(() {
                _page = index;
                testWidget = Scaffold(
                  body: Center(
                    child: Text(Provider.of<UserProvider>(context).user.token),
                  ),
                );
              });
            },
          ),
          body: Container(
            color: Colors.blueAccent,
            child: Center(
              child: getNavBarPage(_page),
            ),
          )),
    );
  }
}
