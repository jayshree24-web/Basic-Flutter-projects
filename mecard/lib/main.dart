import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('lib/images/jayshree.jpg'),
              ),
              Text(
                'Jayshree Karmakar',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Srisakdi'),
              ),
              Text(
                'CYBERSECURITY ENTHUSIAST',
                style: TextStyle(
                    fontSize: 20.5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    wordSpacing: 2.0,
                    color: Colors.purple,
                    fontFamily: 'PTSerif'),
              ),
              SizedBox(
                height: 10.0,
                width: 200.0,
                child: Divider(color: Colors.black87),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.black87),
                    title: Text(
                      'jayshreek315@gmail.com',
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'PTSerif',
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(Icons.phone, color: Colors.black87),
                      title: Text(
                        '+91-8104417087',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'PTSerif',
                            fontSize: 20.0),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
