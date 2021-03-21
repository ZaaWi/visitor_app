import 'package:flutter/material.dart';


class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: IconButton(
                color: Colors.grey[400],
                icon: Icon(Icons.photo_camera_rounded,size: 35,),
                onPressed: () {
                  print('change photo');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}


// FlatButton(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(50),
// side: BorderSide(color: Colors.white),
// ),
// color: Color(0xFFF5F6F9),
// onPressed: () {},
// child: Icon(Icons.account_circle,size: 35,),
// ),