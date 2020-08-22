import 'package:drawer/widgets/Trips.dart';
import 'package:drawer/widgets/crop.dart';
import 'package:drawer/widgets/payment.dart';
import 'package:drawer/widgets/stock.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            trips,
            SizedBox(height: 10),
            stock,
            SizedBox(height: 10),
            crop,
            SizedBox(height: 10),
            payment,
          ],
        ),
      ),
    );
  }
}
