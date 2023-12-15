import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getx/model/model.dart';
import 'package:getx/view/homepage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationCacheDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<studentmodel>(studentmodelAdapter());
  await Hive.openBox<studentmodel>("schoolstudent");

  ThemeData _darkTheme = ThemeData(
      hintColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  ThemeData _lightTheme = ThemeData(
      hintColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));
  runApp(
    GetMaterialApp(
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  );
}
