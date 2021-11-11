import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tajir/app.dart';

void main() async {
  await GetStorage.init();
  runApp(AlgyrApp());
}
