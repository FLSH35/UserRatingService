import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/rating_widget.dart';
import 'package:my_first_flutter_app/rating_widget_2.dart';
import 'package:my_first_flutter_app/rating_widget_3.dart';

/**
 * In this sample app a rating popup is implemented when pushing the
 * button. To review the rating results just look in the console.
 */

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> dynamicWidgets = [];

  /**
   * This widget class lets you rate the service in three different categories:
   * Cleanliness, Availability, Overall Experience
   *
   * When creating an object of this class you need to provide a function as a
   * parameter. This is import for the return-List of the rating-results.
   */
  void createWidget() {
    setState(() {
      dynamicWidgets.add(RatingWidgetThree(
        onSubmit: (
            List<double> ratings) =>
            print("Cleaniless " + ratings[0].toString() +
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
