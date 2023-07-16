import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidgetThree extends StatefulWidget {
  final String title;
  final Function(List<double>) onSubmit;

  RatingWidgetThree({
    Key? key,
    required this.title,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _RatingWidgetThreeState createState() => _RatingWidgetThreeState();
}
class _RatingWidgetThreeState extends State<RatingWidgetThree> {
  List<String> popupTitles = ['Cleanliness', 'Availability', 'Overall Experience'];
  List<double> ratings = [1, 1, 1];
  List<Widget> dynamicWidgets = [];
  int ratingIndex = 0;

  @override
  void initState() {
    super.initState();
    dynamicWidgets.add(
      Column(
        children: [
          Text(popupTitles[0]),
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
        ],
      ),
    );
  }

  void removeWidget() {
    setState(() {
      dynamicWidgets.clear();
    });
    Navigator.of(context).pop();
  }

  void pressedSubmit() {
    ratingIndex++;
    if (ratingIndex < popupTitles.length) {


      setState(() {
        dynamicWidgets.add(
          Column(
            children: [
              Text(popupTitles[ratingIndex]),
              RatingBar.builder(
                initialRating: ratings[ratingIndex],
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
                    ratings[ratingIndex] = rating;
                  });
                },
              ),
            ],
          ),
        );
        dynamicWidgets.removeAt(0);
      });
    } else {
      removeWidget();
      widget.onSubmit(ratings);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: dynamicWidgets,
      ),
      actions: [
        TextButton(
          child: const Text('SUBMIT'),
          onPressed: () {
            pressedSubmit();
          }
        ),
      ],
    );
  }
}
