import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _appBarHeight,
            pinned: _appBarBehavior == AppBarBehavior.pinned,
            floating: _appBarBehavior == AppBarBehavior.floating || _appBarBehavior == AppBarBehavior.snapping,
            snap: _appBarBehavior == AppBarBehavior.snapping,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.create),
                tooltip: 'Edit',
                onPressed: () {
                  _scaffoldKey.currentState
                      .showSnackBar(const SnackBar(content: Text("Editing isn't supported in this screen.")));
                },
              ),
              PopupMenuButton<AppBarBehavior>(
                onSelected: (AppBarBehavior value) {
                  setState(() {
                    _appBarBehavior = value;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuItem<AppBarBehavior>>[
                      const PopupMenuItem<AppBarBehavior>(
                          value: AppBarBehavior.normal, child: Text('App bar scrolls away')),
                      const PopupMenuItem<AppBarBehavior>(
                          value: AppBarBehavior.pinned, child: Text('App bar stays put')),
                      const PopupMenuItem<AppBarBehavior>(
                          value: AppBarBehavior.floating, child: Text('App bar floats')),
                      const PopupMenuItem<AppBarBehavior>(value: AppBarBehavior.snapping, child: Text('App bar snaps')),
                    ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Dinesh Ahuja'),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Hero(
                    tag: 'profile_pic',
                    child: Image.asset(
                      'assets/profile.png',
                      //   package: 'flutter_gallery_assets',
                      fit: BoxFit.cover,
                      height: _appBarHeight,
                    ),
                  ),
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.4),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.dark,
                child: _ContactCategory(
                  icon: Icons.call,
                  children: <Widget>[
                    _ContactItem(
                      icon: Icons.message,
                      tooltip: 'Send message',
                      onPressed: () {
                        _scaffoldKey.currentState.showSnackBar(
                            const SnackBar(content: Text('Pretend that this opened your SMS application.')));
                      },
                      lines: const <String>[
                        '(123) 456-7890',
                        'Mobile',
                      ],
                    ),
                    _ContactItem(
                      icon: Icons.message,
                      tooltip: 'Send message',
                      onPressed: () {
                        _scaffoldKey.currentState
                            .showSnackBar(const SnackBar(content: Text('A messaging app appears.')));
                      },
                      lines: const <String>[
                        '(456) 789-0123',
                        'Work',
                      ],
                    ),
                    _ContactItem(
                      icon: Icons.message,
                      tooltip: 'Send message',
                      onPressed: () {
                        _scaffoldKey.currentState.showSnackBar(
                            const SnackBar(content: Text('Imagine if you will, a messaging application.')));
                      },
                      lines: const <String>[
                        '(789) 012-3456',
                        'Home',
                      ],
                    ),
                  ],
                ),
              ),
              _ContactCategory(
                icon: Icons.contact_mail,
                children: <Widget>[
                  _ContactItem(
                    icon: Icons.email,
                    tooltip: 'Send personal e-mail',
                    onPressed: () {
                      _scaffoldKey.currentState
                          .showSnackBar(const SnackBar(content: Text('Here, your e-mail application would open.')));
                    },
                    lines: const <String>[
                      'dev@kabiir.me',
                      'Personal',
                    ],
                  ),
                  _ContactItem(
                    icon: Icons.email,
                    tooltip: 'Send work e-mail',
                    onPressed: () {
                      _scaffoldKey.currentState
                          .showSnackBar(const SnackBar(content: Text('Summon your favorite e-mail application here.')));
                    },
                    lines: const <String>[
                      'hire@kabiir.me',
                      'Work',
                    ],
                  ),
                ],
              ),
              _ContactCategory(
                icon: Icons.location_on,
                children: <Widget>[
                  _ContactItem(
                    icon: Icons.map,
                    tooltip: 'Open map',
                    onPressed: () {
                      _scaffoldKey.currentState
                          .showSnackBar(const SnackBar(content: Text('This would show a map of San Francisco.')));
                    },
                    lines: const <String>[
                      'India',
                      'Home',
                    ],
                  ),
                  _ContactItem(
                    icon: Icons.map,
                    tooltip: 'Open map',
                    onPressed: () {
                      _scaffoldKey.currentState
                          .showSnackBar(const SnackBar(content: Text('This would show a map of Mountain View.')));
                    },
                    lines: const <String>[
                      'Remote',
                      'Work',
                    ],
                  ),
                ],
              ),
              _ContactCategory(
                icon: Icons.today,
                children: <Widget>[
                  _ContactItem(
                    lines: const <String>[
                      'Birthday',
                      'June 13th, 1995',
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _ContactCategory extends StatelessWidget {
  final IconData icon;

  final List<Widget> children;
  const _ContactCategory({Key key, this.icon, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: themeData.dividerColor))),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  width: 72.0,
                  child: Icon(icon, color: themeData.primaryColor)),
              Expanded(child: Column(children: children))
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;

  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;
  _ContactItem({Key key, this.icon, this.lines, this.tooltip, this.onPressed})
      : assert(lines.length > 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = lines.sublist(0, lines.length - 1).map((String line) => Text(line)).toList();
    columnChildren.add(Text(lines.last, style: themeData.textTheme.caption));

    final List<Widget> rowChildren = <Widget>[
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: columnChildren))
    ];
    if (icon != null) {
      rowChildren.add(SizedBox(
          width: 72.0, child: IconButton(icon: Icon(icon), color: themeData.primaryColor, onPressed: onPressed)));
    }
    return MergeSemantics(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: rowChildren)),
    );
  }
}
