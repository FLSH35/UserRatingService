import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/rating_widget.dart';
import 'package:my_first_flutter_app/rating_widget_2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> dynamicWidgets = [];

  void createWidget() {
    setState(() {
      dynamicWidgets.add(RatingWidgetTwo(
        title: 'popup',
        onSubmit: (
            List<double> ratings) =>
            print("Cleanilesss " + ratings[0].toString() +
                " Availability " + ratings[1].toString() +
                " Overall Experience " + ratings[2].toString()),
      ),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: createWidget,
              child: const Icon(Icons.star_rate_rounded),
            ),
            SizedBox(height: 20),
            Column(
              children: dynamicWidgets,
            ),
          ],
        ),

      ),
    );
  }
}

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
