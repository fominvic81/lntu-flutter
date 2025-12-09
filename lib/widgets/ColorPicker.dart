

import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  @override
  State<ColorPicker> createState() => ColorPickerState();
}

class ColorPickerState extends State<ColorPicker> {
  int _r = 0;
  int _g = 0;
  int _b = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: 200,
            height: 200,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, _r, _g, _b),
                )
            ),
          ),
        ),
        Text("Red $_r"),
        Slider(value: _r.toDouble() / 255, onChanged: (value) => setState(() {
          _r = (value * 255).floor();
        })),
        Text("Green $_g"),
        Slider(value: _g.toDouble() / 255, onChanged: (value) => setState(() {
          _g = (value * 255).floor();
        })),
        Text("Blue $_b"),
        Slider(value: _b.toDouble() / 255, onChanged: (value) => setState(() {
          _b = (value * 255).floor();
        })),
      ],
    );
  }
}