import 'package:drawer/dashboard.dart';
import 'package:flutter/material.dart';

import 'widgets/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: const Color(0xff34211e)),
      ),
      drawer: Drawer(
        child: drawerList,
      ),
      body: DashboardScreen(),
    );
  }
}
