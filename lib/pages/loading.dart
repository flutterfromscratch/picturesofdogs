// import 'dart:html';

// import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:picturesofdogs/pages/dogsbrowser/dogs.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  var expanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        expanded = true;
      });
    }).then((value) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) => DogsHome(),
            ),
            (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        color: expanded ? Theme.of(context).primaryColor : Theme.of(context).secondaryHeaderColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 1),
              height: expanded ? 432 : 115,
              width: expanded ? 432 : 115,
              decoration: expanded ? dogBoxDecoration('assets/dog1.jpg') : dogBoxDecoration('assets/smalldog.jpg'),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration dogBoxDecoration(final String imageAsset) {
    // final String imageAsset;

    return BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.5),
          )
        ],
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(imageAsset),
        ));
  }
}
