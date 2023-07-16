import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


/**
 * This widget class lets you rate the service in three different categories:
 * Cleanliness, Availability, Overall Experience
 *
 * When creating an object of this class you need to provide a function as a
 * parameter. This is import for the return-List of the rating-results.
 */

class RatingWidgetThree extends StatefulWidget {
  final Function(List<double>) onSubmit;

  RatingWidgetThree({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _RatingWidgetThreeState createState() => _RatingWidgetThreeState();
}

/**
 * In order to have three different menus, we need to initalize one menu first
 * and change it for every category. After clicking three times on submit the
 * last widget-element will be deleted and the popup-window closed.
 */
class _RatingWidgetThreeState extends State<RatingWidgetThree> {
  List<String> popupTitles = ['Cleanliness', 'Availability', 'Overall Experience'];
  List<double> ratings = [1, 1, 1];
  List<Widget> dynamicWidgets = [];
  int ratingIndex = 0;

  @override
  void initState() {
    super.initState();
    pressedSubmit();
  }

  /**
   * This is the most important part of the widget. The visible Widget-List
   * is cleared before adding a new Rating-Widget for each category.
   */

  void pressedSubmit() {
    ratingIndex++;

    if (ratingIndex <= popupTitles.length) {
      setState(() {
        dynamicWidgets.clear();
        dynamicWidgets.add(
          Column(
            children: [
              Text(popupTitles[ratingIndex - 1]),
              RatingBar.builder(
                initialRating: ratings[ratingIndex - 1],
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
                    ratings[ratingIndex - 1] = rating;
                  });
                },
              ),
            ],
          ),
        );
      });
    } else {
      removeWidget();
      widget.onSubmit(ratings);
    }
  }

  /**
   * This is the last function called and it its purpose is to clear all
   * visible widgets and close the popup-window.
   */
  void removeWidget() {
    setState(() {
      dynamicWidgets.clear();
    });
    Navigator.of(context).pop();
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
          },
        ),
      ],
    );
  }
}
