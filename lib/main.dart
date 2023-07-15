import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: MyHomePage(
        title: 'popup',
        onSubmit: (
            List<double> ratings) =>
            print("Cleanilesss " + ratings[0].toString() +
                " Availability " + ratings[1].toString() +
                " Overall Experience " + ratings[2].toString()),
      ),
    );
  }
}
