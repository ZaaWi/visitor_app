import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visitor_app/models/event_model.dart';
import 'package:visitor_app/providers/search_provider.dart';
import 'package:visitor_app/screens/components/animations/fade_animation.dart';
import 'package:visitor_app/screens/components/events/list_item.dart';
import 'package:visitor_app/screens/event_screen.dart';

class ItemsCardList extends StatefulWidget {
  @override
  _ItemsCardListState createState() => _ItemsCardListState();
}

class _ItemsCardListState extends State<ItemsCardList> {
  final String query = r"""
  
  
  
 query search ($title: String!) {
  events(where: {title_contains: $title}) {
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
              ListItem(
                context: context,
                event: e,
              ),
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
    return Query(
      options: QueryOptions(document: gql(query), variables: {
        'title': (Provider.of<SearchData>(context).searchText) == null
            ? ''
            : Provider.of<SearchData>(context).searchText,
      }),
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
        for (var e in result.data['events']) {
          Event event = Event(
            title: e['title'],
            description: e['description'],
            dateTime: e['date'],
            img: e['image'][0]['formats'],
          );
          eventList.add(event);
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
