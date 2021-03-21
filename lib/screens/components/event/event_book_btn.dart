

import 'package:flutter/material.dart';
import 'package:visitor_app/models/event_model.dart';

class EventBookBtn extends StatelessWidget {
  EventBookBtn({
    @required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.lightBlue,
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Colors.lightBlue,
                onPressed: () {},
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}