import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visitor_app/providers/user_provider.dart';
import 'package:visitor_app/screens/app_screen.dart';
import 'package:visitor_app/screens/login_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String identifier;
  final String password;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();

  LoadingScreen({this.identifier, this.password});

}

class _LoadingScreenState extends State<LoadingScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //   nextScreen();
  // }



  void homeRedirect () async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {

      return AppScreen(
      );
    }));
  }



  final String query = r"""
                 mutation {
  login(input: { identifier: "user1", password: "User123" }) {
    jwt
    user {
      username
      id
      email
      role {
        id
      }
      
      
      
      
    }
  }
}


                  """;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Query(
        options: QueryOptions(
          document: gql(query),
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}
            ) {
          if (result.isLoading) {
            return Center(
              child: SpinKitDoubleBounce(
                color: Colors.yellow[100],
                size: 100,
              ),
            );
          }
          if (result.data == null) {
            print('returned null');
            return Center(
              child: Text('here'),
            );
          }
          //TODO: navigate to app main screen
          print('all data');
          print(result.data);
          print('jwt');
          print(result.data['login']['jwt']);
          print(result.data['login']['user']['username']);
          print(result.data['login']['user']['id']);
          int i = int.parse(result.data['login']['user']['id']);
          Provider.of<UserProvider>(context).setUserData(
            token: result.data['login']['jwt'],
            id: i,
            userName: result.data['login']['user']['username'],
          );






          // print(widget.identifier);
          // print(widget.password);
          homeRedirect();

          // setState(() {
          //   Navigator.pushNamed(context, '/ok');
          // });

          return Center(
            child: SpinKitDoubleBounce(
              duration: Duration(milliseconds: 100),
              color: Colors.green[100],
              size: 100,
            ),
          );
        },
      ),
    );
  }


}


// Center(
// child: SpinKitDoubleBounce(
// color: Colors.blue,
// size: 100,
// ),
// ),