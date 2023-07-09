import 'package:flutter/material.dart';

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
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {_incrementCounter; showPopup(context);},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showPopup(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Name'),
        content: TextField(
          decoration: InputDecoration(hintText: 'Enter'),
        ),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.image),
            label: const Text(''),
            onPressed: () {
              // Handle image button press
              // You can implement image uploading logic here
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.image),
            label: const Text(''),
            onPressed: () {
              // Handle image button press
              // You can implement image uploading logic here
              Navigator.of(context).pop(); // Close the dialog
            },
          ),



          TextButton.icon(
            icon: Icon(Icons.image),
            label: const Text(''),
            onPressed: () {
              // Handle image button press
              // You can implement image uploading logic here
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.image),
            label: const Text(''),
            onPressed: () {
              // Handle image button press
              // You can implement image uploading logic here
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.image),
            label: const Text(''),
            onPressed: () {
              // Handle image button press
              // You can implement image uploading logic here
              Navigator.of(context).pop(); // Close the dialog
            },
          ),

          TextButton(
            child: const Text('SUBMIT'),
            onPressed: () {
              // Handle submit button press
              // You can access the entered text using the TextField controller or by maintaining a variable in the parent widget's state
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      ),
    );
  }

}
