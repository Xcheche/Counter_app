import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  bool _isNightMode = false;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _toggleNightMode() {
    setState(() {
      _isNightMode = !_isNightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isNightMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Prayer Counter'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _toggleNightMode,
              icon:
                  Icon(_isNightMode ? Icons.wb_sunny : Icons.nightlight_round),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: StadiumBorder(),
                    onSurface: Colors.lightBlue),
                onPressed: _increment,
                child: const Text(
                  'Start Count',
                  style: TextStyle(fontSize: 28, color: Colors.blueAccent),
                ),
              ),
              Text(
                'Total Count $_counter times',
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.lightBlueAccent),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.blueAccent,
          onPressed: () {
            setState(() {
              _counter = 0;
              Navigator.pop(context);
              const Icon(Icons.arrow_back);
            });
          },
          splashColor: Colors.blueGrey,
          child: const Text('Reset'),
        ),
      ),
    );
  }
}

void main() {
  runApp(const Counter());
}
