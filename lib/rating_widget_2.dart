import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidgetTwo extends StatefulWidget {
  final String title;
  final Function(List<double>) onSubmit;

  RatingWidgetTwo({
    Key? key,
    required this.title,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _RatingWidgetTwoState createState() => _RatingWidgetTwoState();
}

List<String> popupTitles = ['Cleanliness', 'Availability', 'Overall Experience'];
List<double> ratings = [0, 0, 0];

class _RatingWidgetTwoState extends State<RatingWidgetTwo> {
  void showPopup(BuildContext context) async {


    for (int i = 1; i < 3; i++) {
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
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
      title: Text(popupTitles[0]),
      content:


      RatingBar.builder(
        initialRating: ratings[0],
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemSize: 30,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          setState(() {
            ratings[0] = rating;
          });
        },
      ),
      actions: [
        TextButton(
          child: const Text('SUBMIT'),
          onPressed: () {
            showPopup(context);
            // Close the dialog
          },
        ),
      ],
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