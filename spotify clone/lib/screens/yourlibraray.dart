import 'package:flutter/material.dart';

class YourLibraray extends StatelessWidget {
  const YourLibraray({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
        'YourLibraray',
        style: TextStyle(fontSize: 30, color: Colors.amberAccent),
      ),
    );
  }
}
