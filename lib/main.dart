import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexels_null_safety/pexels_null_safety.dart';
// import 'package:pexels/pexels.dart';
import 'package:picturesofdogs/pages/loading.dart';
import 'package:picturesofdogs/services/dogloaderservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.teal,
              textTheme: GoogleFonts.notoSansTextTheme()),
          home: LoadingPage()),
      providers: [
        RepositoryProvider(
          create: (context) => PexelsClient('apiclientkey'), // todo make this a command line thing
        ),
        RepositoryProvider(create: (context) => AssetsDogLoader())
      ],
    );
  }
}
