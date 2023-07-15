import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final Function(List<double>) onSubmit;

  MyHomePage({
    Key? key,
    required this.title,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showPopup(BuildContext context) async {
    List<String> popupTitles = ['Cleanliness', 'Availability', 'Overall Experience'];
    List<double> ratings = [0, 0, 0];

    for (int i = 0; i < 3; i++) {
      await showDialog(
        context: context,
        builder: (context) => RatingPopup(
          title: popupTitles[i],
          initialRating: ratings[i],
          onRatingUpdate: (rating) {
            setState(() {
              ratings[i] = rating;
            });
          },
        ),
      );
    }
    widget.onSubmit(ratings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showPopup(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RatingPopup extends StatelessWidget {
  final String title;
  final double initialRating;
  final ValueChanged<double> onRatingUpdate;

  const RatingPopup({
    Key? key,
    required this.title,
    required this.initialRating,
    required this.onRatingUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: RatingBar.builder(
        initialRating: initialRating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemSize: 30,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: onRatingUpdate,
      ),
      actions: [
        TextButton(
          child: const Text('SUBMIT'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}
