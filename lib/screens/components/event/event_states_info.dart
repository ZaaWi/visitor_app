import 'package:flutter/material.dart';
import 'package:visitor_app/models/event_model.dart';

class EventStatesInfo extends StatelessWidget {
  const EventStatesInfo({
    Key key,
    @required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("State"),
              Row(
                children: <Widget>[
                  ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(color: Color(0xFFF8C078)),
                  ColorDot(color: Color(0xFFA29B9B)),
                ],
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Color(0xFF535353)),
              children: [
                TextSpan(text: "visitors\n"),
                TextSpan(
                  text: " cm",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20 / 4,
        right: 20 / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
