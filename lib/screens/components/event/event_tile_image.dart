import 'package:flutter/material.dart';
import 'package:visitor_app/api/api_config.dart';
import 'package:visitor_app/models/event_model.dart';

class EventTileImage extends StatelessWidget {
  const EventTileImage({
    @required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              event.title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                image: NetworkImage('$apiUrl${event.img}'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Image.asset(
// event.img,
// fit: BoxFit.fill,
// ),

// Hero(
// tag: "${event.id}",
// child: Image.network('$apiUrl${event.img}'),
// ),