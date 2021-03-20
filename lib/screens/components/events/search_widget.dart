import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitor_app/providers/search_provider.dart';
import 'package:visitor_app/screens/components/animations/fade_animation.dart';


class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String searchValue;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(1, Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white
      ),
      child: TextField(
        onChanged: (newValue) {
          searchValue = newValue;
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {
                print('icon pressed');
                print(searchValue);
                Provider.of<SearchData>(context).updateSearchText(searchValue);
              },
            ),
            hintText: "Search Event",
            hintStyle: TextStyle(color: Colors.grey)
        ),
      ),
    ));
  }
}
