import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picturesofdogs/pages/dogsbrowser/browser/dogbrowser.dart';
// import 'package:picturesofdogs/pages/dogsbrowser/browser/dogbrowser.dart';
import 'package:picturesofdogs/pages/dogsbrowser/profile/profile.dart';

class DogsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('okay'),
      ),
      body: Column(
        children: [
          ProfileWidget(),
          Expanded(child: DogBrowserWidget()),
        ],
      ),
    );
    // return ScrollView(
    //     headerSliverBuilder: (context, innerBoxScrolled) => [ProfileWidget()],
    //     body: Column(
    //       children: [DogBrowserWidget()],
    //     ));
  }
}
