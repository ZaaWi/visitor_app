
import 'package:flutter/material.dart';
import 'package:visitor_app/api/api_config.dart';
import 'package:visitor_app/models/event_model.dart';

Widget ListItem({Event event, BuildContext context}) {
  return FlatButton(
    // onPressed: () {
    //   //TODO: show event details goes here,
    //   showModalBottomSheet(
    //     isScrollControlled: true,
    //     backgroundColor: Colors.transparent,
    //     context: context,
    //     // builder: (context) => TicketWidget(),
    //     builder: (context) => EventScreen(
    //       product: products[0],
    //     ),
    //   );
    // },
    child: Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 200,
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                event.getDay(event.dateTime),
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                event.getDate(event.dateTime),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage('$apiUrl${event.img}'),
                    fit: BoxFit.cover),
              // image: Image.network(event.img),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    event.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        event.getTime(event.dateTime).toString(),
                        style: TextStyle(color: Colors.white,),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}