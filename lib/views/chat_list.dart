import 'package:flutter/material.dart';

import 'widgets/chat_list_item.dart';

class ChatListView extends StatefulWidget {
  @override
  ChatListViewState createState() {
    return ChatListViewState();
  }
}

class ChatListViewState extends State<ChatListView> with TickerProviderStateMixin {
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
            ChatListItemWidget(),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
