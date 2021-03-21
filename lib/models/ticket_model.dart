import 'package:visitor_app/models/event_model.dart';

class Ticket {
  int id;
  String ticketName;
  bool expired;
  Event event;

  Ticket(
      {this.id,
      this.ticketName,
      this.expired,
      this.event});
}
