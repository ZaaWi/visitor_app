import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitor_app/providers/user_provider.dart';

import 'components/my_tickets/my_tickets_items.dart';

class MyTicketsScreen extends StatefulWidget {
  @override
  _MyTicketsScreenState createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        title: Text(
          Provider.of<UserProvider>(context).user.userName,
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    //TODO: fix tihs image
                      image: AssetImage('assets/images/four.jpg'),
                      fit: BoxFit.cover)),
              child: Transform.translate(
                offset: Offset(15, -15),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white),
                      shape: BoxShape.circle,
                      color: Colors.yellow[800]),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // SearchWidget(),
              MyTicketsItems(),
            ],
          ),
        ),
      ),
    );
  }
}
