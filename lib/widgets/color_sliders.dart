import 'package:flutter/material.dart';
import 'package:lntu_flutter/providers/color_provider.dart';
import 'package:provider/provider.dart';

class ColorSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ColorProvider>(context);
    return Column(
      children: [
        Text("Red ${(provider.color.r * 255).floor()}"),
        Slider(
          value: provider.color.r * 255,
          min: 0,
          max: 255,
          onChanged: (value) =>
              provider.color = provider.color.withRed(value.toInt()),
        ),
        Text("Green ${(provider.color.g * 255).floor()}"),
        Slider(
          value: provider.color.g * 255,
          min: 0,
          max: 255,
          onChanged: (value) =>
              provider.color = provider.color.withGreen(value.toInt()),
        ),
        Text("Blue ${(provider.color.b * 255).floor()}"),
        Slider(
          value: provider.color.b * 255,
          min: 0,
          max: 255,
          onChanged: (value) =>
              provider.color = provider.color.withBlue(value.toInt()),
        ),
      ],
    );
  }
}
