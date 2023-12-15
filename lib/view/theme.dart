  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:getx/view/homepage.dart';
  class ThemeSwitcher extends StatefulWidget {
    @override
    State<ThemeSwitcher> createState() => _ThemeSwitcherState();
  }

  class _ThemeSwitcherState extends State<ThemeSwitcher> {

     RxBool _isLightTheme = false.obs;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Theme Switcher'),
        ),
        body: Column(
          children: [

              Obx(
                  () => Text(
                    'Click on switch to change to ${_isLightTheme.value ? 'Dark' : 'Light'} theme',
                  ),
                ),

                      ObxValue(
                  (data) => Switch(
                    value: _isLightTheme.value,
                    onChanged: (val) {
                      _isLightTheme.value = val;
                      Get.changeThemeMode(
                        _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                      );
                     
                    },
                  ),
                  false.obs,
                ),
            // ListTile(
            //   leading: Icon(Icons.wb_sunny_outlined),
            //   title: Text('White screen'),
            //   onTap: () => {Get.changeTheme(ThemeData.light())},
            // ),
            // ListTile(
            //   leading: Icon(Icons.wb_shade_outlined),
            //   title: Text('Dark screen'),
            //   onTap: () => {Get.changeTheme(ThemeData.dark())},
            // ),
          ],
        ),
      );
    }
  }
