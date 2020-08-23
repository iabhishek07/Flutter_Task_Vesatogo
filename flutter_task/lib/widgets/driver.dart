import 'package:flutter/material.dart';

Column driver = Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      alignment: Alignment.bottomCenter,
      height: 150.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[500],
              ),
              Text(
                'Ram Kadam',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
                height: 25.0,
                width: 140.0,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.lightGreen[300],
                    onPressed: () {},
                    child: Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 30,
                width: 30,
                color: Colors.green,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MH 15 FB 2844',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'TATA ACE',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100.0,
              ),
              IconButton(
                icon: Icon(
                  Icons.call,
                  size: 35.0,
                  color: Colors.grey[600],
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    ),
  ],
);
