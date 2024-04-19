import 'package:flutter/material.dart';

// example for interface for shape drawing
class ShapeDraw {
  void draw() {
    print("Drawing shape...");
  }
}

// mixin for adding color functionality
mixin ColorMixin {
  Color color = Colors.blue;
}

// mixin for addring border functionality
mixin BorderMixin {
  Border border = Border.all(
    color: Colors.pink,
    width: 2,
  );
}

// class implementing ShapeDraw interface with mixins
// MyCustomWidget has a color property, a border property, and a draw method
class MyCustomWidget extends StatefulWidget with ColorMixin, BorderMixin implements ShapeDraw {
  @override
  void draw() {
    print("Drew a shape!");
    }

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}


class _MyCustomWidgetState extends State<MyCustomWidget>  {
  bool drawShape = false;
  void draw() {
    setState(() {
      drawShape = true;
    });
    widget.draw(); // call draw() method of ShapeDraw
  }

  void clear() {
    setState(() {
      drawShape = false;
    });
  }

  // method for drawing shape and buttons
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (drawShape)
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: widget.color,
              border: widget.border,
            ),
          ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: draw,
          child: Text('Draw'),
        ),
        ElevatedButton(
          onPressed: clear,
          child: Text('Clear'),
        ),
      ],
    );
  }
}

// Main method
void main() {
  runApp(MyApp());
}

// MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Demo'),
        ),
        body: Center(
          child: MyCustomWidget(),
        ),
      ),
    );
  }
}

