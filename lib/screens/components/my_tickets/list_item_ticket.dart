import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_app/models/ticket_model.dart';

Widget TicketListItem({Ticket ticket, BuildContext context}) {
  return Row(
    children: [
      FlatButton(
        onPressed: () {
          //TODO: show ticket goes here
          // showModalBottomSheet(
          //   isScrollControlled: true,
          //   backgroundColor: Colors.transparent,
          //   context: context,
          //   builder: (context) => TicketWidget(),
          //   // builder: (context) => EventScreen(
          //   //   product: products[0],
          //   // ),
          // );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // getEventItems(eventList),
            Container(
              width: 330,
              height: 100,
              // margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Text(
                        ticket.ticketName,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 120),
                      Text(
                        ticket.event.getDay(ticket.event.dateTime),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(ticket.event.location),
                      Text(ticket.event.getDate(ticket.event.dateTime)),
                      Text(ticket.event.getTime(ticket.event.dateTime)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
