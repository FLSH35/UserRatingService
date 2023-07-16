import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatefulWidget {
  final String title;
  final Function(List<double>) onSubmit;

  RatingWidget({
    Key? key,
    required this.title,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  void showPopup(BuildContext context) async {
    List<String> popupTitles = ['Cleanliness', 'Availability', 'Overall Experience'];
    List<double> ratings = [0, 0, 0];

    for (int i = 0; i < 3; i++) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 300, // Set the desired width
            height: 300, // Set the desired height
            child: RatingPopup(
              title: popupTitles[i],
              initialRating: ratings[i],
              onRatingUpdate: (rating) {
                setState(() {
                  ratings[i] = rating;
                });
              },
            ),
          ),
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
      title: Text('Cleaniless'),
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