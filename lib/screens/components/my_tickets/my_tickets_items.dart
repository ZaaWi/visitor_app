import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visitor_app/models/event_model.dart';
import 'package:visitor_app/models/ticket_model.dart';
import 'package:visitor_app/providers/user_provider.dart';
import 'package:visitor_app/screens/components/animations/fade_animation.dart';

import 'list_item_ticket.dart';

class MyTicketsItems extends StatefulWidget {
  @override
  _MyTicketsItemsState createState() => _MyTicketsItemsState();
}

class _MyTicketsItemsState extends State<MyTicketsItems> {


  final String myTicketsQuery = r"""
  
  
  
 query Tickets ($user_id: Int!)  {
  bookzs (where: {booked_user:{id: $user_id}})  {
    id
    expired
    booked_user {
      id
    }
    ticket {
      name
      event {
        id
        title
        date
        location
        image {
          formats: url
        }
      }
    }
  }
}




                  """;





  List<Ticket> samples = [
    Ticket(
      ticketName: 'ticket name',
    ),
    Ticket(
      ticketName: 'ticket name',
    ),
    Ticket(
      ticketName: 'ticket name',
    ),
    Ticket(
      ticketName: 'ticket name',
    ),
  ];

  Widget getTicketsItems(List<Ticket> tickets) {
    List<Widget> list = List<Widget>();
    for (Ticket t in tickets) {
      list.add(
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
              1.2,
              TicketListItem(context: context, ticket: t),
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
      options: QueryOptions(
        document: gql(myTicketsQuery),
        variables: {
          //TODO: variables
          'user_id': Provider.of<UserProvider>(context).user.id,
        },
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(result.data == null) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        }
        List<Ticket> ticketsList = [];
        print(result.data['bookzs'][0]['id']);
        for(var book in result.data['bookzs']) {
          Ticket ticket = Ticket(
            ticketName: book['ticket']['name'],
            // eventDate: book['ticket']['event']['date'],
            event: Event(
              title: book['ticket']['event']['title'],
              dateTime: book['ticket']['event']['date'],
              location: book['ticket']['event']['location'],
            ),
          );
          ticketsList.add(ticket);
          print(book['id']);
          print(book['ticket']['name']);
        }


        return Center(
          child: getTicketsItems(ticketsList),
        );
      },
    );
  }
}
