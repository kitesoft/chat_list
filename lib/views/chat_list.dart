import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  @override
  ChatListState createState() {
    return ChatListState();
  }
}

class ChatListState extends State<ChatList> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.black87,
            labelStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            controller: TabController(length: 3, vsync: this),
            tabs: <Widget>[
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.message,
                      color: Colors.black87,
                    ),
                    Text('Chat')
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.contacts,
                      color: Colors.black87,
                    ),
                    Text('Friends')
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.group,
                      color: Colors.black87,
                    ),
                    Text('Group')
                  ],
                ),
              ),
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/profile.png'),
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
            )
          ],
        ),
      ],
    );
  }
}
