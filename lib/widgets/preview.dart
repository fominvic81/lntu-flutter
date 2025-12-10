import 'package:flutter/material.dart';
import 'package:lntu_flutter/providers/color_provider.dart';
import 'package:provider/provider.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ColorProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: 200,
            height: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(color: provider.color),
            ),
          ),
        ),
      ],
    );
  }
}
