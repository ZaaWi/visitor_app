import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visitor_app/models/event_model.dart';
import 'package:visitor_app/providers/user_provider.dart';
import 'package:visitor_app/screens/components/animations/fade_animation.dart';
import 'package:visitor_app/screens/components/events/list_item.dart';

class WishlistCardList extends StatefulWidget {
  @override
  _WishlistCardListState createState() => _WishlistCardListState();
}

class _WishlistCardListState extends State<WishlistCardList> {
  final String wishlistQuery = r"""
  
  
  
 query  wishlist ($id: Int) {
  users (where: {id: $id})  {
    wishlist {
      id
    title
    city {
      name
    }
    description
    date
    tickts {
      name
    }
    image {
      formats:url
    }
    }
  }
}




                  """;

  Widget getEventItems(List<Event> evs) {
    //TODO: refactor and redesign for real data, duplicated widget
    List<Widget> list = List<Widget>();
    for (Event e in evs) {
      list.add(
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
              1.2,
              ListItem(context: context, event: e),
            ),
          ],
        ),
      );
    }
    return Column(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<UserProvider>(context).user.id);
    return Query(
      options: QueryOptions(
        document: gql(wishlistQuery),
        variables: {
          'id': Provider.of<UserProvider>(context).user.id,
        },
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.isLoading) {
          return Center(
            child: SpinKitDoubleBounce(
              color: Colors.orange,
              size: 100,
            ),
          );
        }
        if (result.data == null) {
          return Center(
            child: SpinKitDoubleBounce(
              color: Colors.red,
              size: 100,
            ),
          );
        }
        List<Event> eventList = [];

        for (var e in result.data['users'][0]['wishlist']) {
          Event event = Event(
            title: e['title'],
            description: e['description'],
            dateTime: e['date'],
            img: e['image'][0]['formats'],
          );
          eventList.add(event);
          print(event.title);
        }

        return Column(
          children: [
            getEventItems(eventList),
          ],
        );
      },
    );
  }
}
