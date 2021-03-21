

import 'package:flutter/material.dart';
import 'package:visitor_app/models/event_model.dart';

class EventDescription extends StatelessWidget {
  const EventDescription({
    Key key,
    @required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
      child: Text(
        event.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
