import 'package:flutter/material.dart';

ListView drawerList = ListView(
  children: [
    UserAccountsDrawerHeader(
      accountName: Text('Jon Doe'),
      accountEmail: Text('jondoe@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.brown,
        child: Text('J'),
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('A'),
        )
      ],
    ),
    ListTile(
      leading: Icon(
        Icons.dashboard,
        size: 25,
        color: Colors.black,
      ),
      title: Text(
        'Dashboard',
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 15.0,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    ),
    Divider(
      color: Colors.grey,
      indent: 15,
      endIndent: 15,
    ),
    ListTile(
      leading: Icon(
        Icons.account_circle,
        size: 25,
        color: Colors.black,
      ),
      onTap: () {},
      title: Text(
        'Profile',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    ),
    Divider(
      color: Colors.grey,
      indent: 15,
      endIndent: 15,
    ),
    ListTile(
      leading: Icon(
        Icons.exit_to_app,
        color: Colors.black,
        size: 25,
      ),
      onTap: () {},
      title: Text(
        'Log out',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    ),
  ],
);
