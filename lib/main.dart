import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "homepage",
      title: "BMI",
      // routes: {
      //   "homepage": (context) {
      //     return const InputPage();
      //   },
      //   "resultpage": (context) {

      //     return  ResultPage(bmi:  , result:  , interpretation: );
      //   }

      // },

      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        // textTheme: const TextTheme(
        //   bodyText1: TextStyle(color: Colors.white),
        // ),
      ),

      home: const InputPage(),

      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     colorScheme:
      //         ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),
      //   ),
      //   child: FloatingActionButton(
      //     // backgroundColor: Colors.deepOrangeAccent,

      //     onPressed: () {},
      //     child: const Icon(Icons.add),
      //   ),
      // ),
    ),
  );
}
