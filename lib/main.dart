import 'package:bluetooth_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          color: kPrimaryColor,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.red),
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            pickerTextStyle: TextStyle(
              color: Colors.blue,
              fontSize: 12,
            ),
          ),
        ),
      ),
      initialRoute: HomeScreen.id,
      debugShowCheckedModeBanner: kReleaseMode ? true : false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
