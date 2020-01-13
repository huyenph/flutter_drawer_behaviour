import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_drawer_bahaviour/drawer_behaviour/drawer_behaviour.dart';

void main() => runApp(MyApp());

const CHECK_IN = 'Check-In';
const CONTACT_LIST = 'Contact list';
const SETTINGS = 'Settings';
const LOGOUT = 'Logout';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer Behaviour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final menu = Menu(
    items: [
      MenuItem(
        id: CHECK_IN,
        title: CHECK_IN,
      ),
      MenuItem(
        id: CONTACT_LIST,
        title: CONTACT_LIST,
      ),
      MenuItem(
        id: SETTINGS,
        title: SETTINGS,
      ),
      MenuItem(
        id: LOGOUT,
        title: LOGOUT,
      ),
    ],
  );

  var selectedMenuItemId = CHECK_IN;
  HashMap<String, Widget> _widgets = HashMap();

  Widget headerView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            CHECK_IN,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Username',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      percentage: 1,
      appBar: AppBarProps(
        elevation: 5.0,
        title: Text(selectedMenuItemId),
        backgroundColor: Colors.blue,
      ),
      menuView: DrawerMenu(
        padding: const EdgeInsets.all(20.0),
        menu: menu,
        color: Colors.blue,
        headerView: headerView(context),
        animation: true,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          if (selectedMenuItemId != itemId) {
            if (itemId != LOGOUT) {
              setState(() {
                selectedMenuItemId = itemId;
              });
            } else {}
          }
        },
      ),
      contentView: Screen(),
    );
  }
}
