import 'package:flutter/material.dart';
import 'counter.dart'; // Make sure you have the Counter widget defined

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black12,
          backgroundColor: Colors.black12,
          title: const Text('Pray Without Season'),
          centerTitle: true,
        ),
        body: const MyHomePage(), // Use the MyHomePage widget as the body
      ),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // Make the stack children fill the entire screen
      children: [
        // Background image
        const Image(
          image: AssetImage('images/mecca.jpg'),
          fit: BoxFit.cover, // Make the image cover the screen
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(), // Add a spacer to push the button upwards
              // Button to navigate to Counter screen
              TextButton(
                  style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.black12),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Counter()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Go To Counter',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
