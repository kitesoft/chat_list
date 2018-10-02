import 'package:flutter/material.dart';

import '../profile.dart';

class ChatListItemWidget extends StatelessWidget {
  ChatListItemWidget();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfileView()));
        },
        child: Hero(
          tag: 'profile_pic',
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
        ),
      ),
      title: Row(
        children: <Widget>[
          Text('Dinesh Ahuja'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: CircleAvatar(
              radius: 10.0,
              child: Text('3'),
            ),
          )
        ],
      ),
      subtitle: Text('Lorem ipsum'),
      trailing: Text('a moment ago'),
    );
  }
}
