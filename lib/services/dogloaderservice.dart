import 'dart:typed_data';
import 'package:flutter/services.dart';

// abstract class IDogLoader {
//   Future<List<Dog>> getDogs();
// }

class Dog {
  final String assetPath;
  final String name;

  Dog(this.assetPath, this.name);
}

class AssetsDogLoader {
  // Future<List<Dog>> getDogs() async {
  //   final dogList = <Dog>[];
  //   for (int i = 1; i <= 12; i++) {
  //     final dogImageBytes = await rootBundle.load('assets/offlinedogs/dog$i.jpg');
  //     dogList.add(Dog(dogImageBytes.buffer.asUint8List(), "Dog $i"));
  //   }
  //   return dogList;
  //
  //   // TODO: implement getDogs
  //   // throw UnimplementedError();
  // }

  Future<List<Dog>> getDogAssets() async {
    
  }



  // Future<List<String>> getDogAssets() async {
  //   final dogs
  // }

}
