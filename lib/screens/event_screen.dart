import 'package:flutter/material.dart';
import 'package:visitor_app/models/event_model.dart';
import 'package:visitor_app/screens/components/animations/fade_animation.dart';

import 'components/event/event_book_btn.dart';
import 'components/event/event_description.dart';
import 'components/event/event_states_info.dart';
import 'components/event/event_tile_image.dart';

class EventScreen extends StatelessWidget {
  final Event event;

  EventScreen({this.event});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.3),
                      padding: EdgeInsets.only(
                        // top: size.height * 0.12,
                        top: 80,
                        left: 20,
                        right: 20,
                      ),
                      // height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: ListView(
                        children: <Widget>[
                          EventStatesInfo(event: event),
                          SizedBox(height: 20 / 2),
                          EventDescription(event: event),
                          EventDescription(event: event),
                          EventDescription(event: event),
                          EventDescription(event: event),
                          SizedBox(height: 150),
                        ],
                      ),
                    ),
                    FadeAnimation(
                      1.1,
                      EventTileImage(event: event),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: EventBookBtn(event: event),
            ),
          ),
        ),
      ],
    );
  }
}
