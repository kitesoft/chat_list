import 'package:flutter/material.dart';

import 'views/chat_list.dart';

void main() => runApp(ChatListApp());

/// Main screen for the chat list app
class ChatListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat List Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.green,
      ),
      home: const _MyHomePage(title: 'Chat List'),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  final String title;

  const _MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(95.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                  hintText: 'Search your Friends...',
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: Icon(
                      Icons.search,
                      size: 30.0,
                    ), // icon is 48px widget.
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  filled: true),
            ),
          ),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          FloatingActionButton(
            onPressed: () {},
            mini: true,
            backgroundColor: Colors.greenAccent[400],
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20.0,
            ),
          )
        ],
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ChatListView(),
          ],
        ),
      ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {},
      //     tooltip: 'Increment',
      //     child: const Icon(Icons.add),
      //   ),
    );
  }
}
