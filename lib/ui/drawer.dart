import 'package:flutter/material.dart';
import 'package:kekradio_client/util/auth.dart';

final drawerHeader = FutureBuilder<User>(
    future: User.getUser(),
    builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
      if (snapshot.hasData) {
        return UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('user.name@email.com'),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(size: 42.0),
              backgroundColor: Colors.white,
            ));
      } else {
        return UserAccountsDrawerHeader(
          accountEmail: Text("meme@meme.mail"),
          accountName: Text("gesu"),
        );
      }
    });
final drawerItems = ListView(
  children: <Widget>[
    drawerHeader,
    ListTile(
      title: Text('To page 1'),
    ),
    ListTile(
      title: Text('To page 2'),
    ),
    ListTile(
      title: Text('other drawer item'),
    ),
  ],
);


// <Null> means this route returns nothing.
class _NewPage extends MaterialPageRoute<Null> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Page $id'),
              elevation: 1.0,
            ),
            body: Center(
              child: Text('Page $id'),
            ),
          );
        });
}
