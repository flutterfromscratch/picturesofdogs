import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DogsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        children: [
          CircleAvatar(
            child: Text("FFS"),
          )
        ],
      ),
      // width: double.infinity,
    );
  }
}
