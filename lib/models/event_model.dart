import 'package:intl/intl.dart';

class Event {
  //TODO: Refactor with real data
  int id;
  String title;
  String description;
  String dateTime;
  List<String> tickets;
  String img;
  String location;

  Event(
      {this.id,
      this.title,
      this.description,
      this.dateTime,
      this.tickets,
      this.img,
      this.location});

  String getTime(String data) {
    final date = DateTime.parse(data);
    final format = DateFormat('HH:MM a');
    var datedata = format.format(date).toString();
    print(datedata);

    return datedata;
  }

  String getDay(String data) {
    final date = DateTime.parse(data);
    final format = DateFormat('EEE');
    var datedata = format.format(date).toString();
    print(datedata);

    return datedata;
  }

  String getDate(String data) {
    final date = DateTime.parse(data);
    final format = DateFormat('MMM d');
    var datedata = format.format(date).toString();
    print(datedata);

    return datedata;
  }
}
