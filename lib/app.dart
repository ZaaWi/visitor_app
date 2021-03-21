import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'api/api_config.dart';
import 'constants/routes.dart';
import 'providers/user_provider.dart';
import 'screens/app_screen.dart';
import 'screens/event_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/login_screen.dart';

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final HttpLink httpLink = HttpLink(gqlUrl);
    final ValueNotifier<GraphQLClient> loginClient = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink as Link,
        cache: GraphQLCache(),
      ),
    );


    return ChangeNotifierProvider(
      builder:  (context) => UserProvider(),
      child: GraphQLProvider(
        client: loginClient,
        child: MaterialApp(
          initialRoute: kRouteLoginScreen,
          routes: {
            // kInitRoute: (context) => AppScreen(),
            kRouteLoginScreen: (context) => LoginScreen(),
            '/ok' : (context) => Container(child: Center(child: Text('ok'),),),
            kRouteLoadingScreen : (context) => LoadingScreen(),
            kRouteEventScreen : (context) => EventScreen(),
            '/app' : (context) => AppScreen(),
            //TODO: define all routes
          },
        ),
      ),
    );
  }
}
