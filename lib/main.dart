import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 25.0;
const _bgColor = Colors.green;
const _borderWidth = 3.0;
const _borderColor = Colors.grey;
const _borderRadius = 4.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const MyHomePage(
        title: 'IPZ-33: Fomin Victor\'s first Flutter App',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              _buildDot(),
              _buildDot(),
              _buildDot(),
              _buildEmpty(),
              //
            ],
          ),
          Row(
            children: [
              _buildEmpty(),
              _buildEmpty(),
              _buildEmpty(),
              _buildDot(),
            ],
          ),
          Row(
            children: [
              _buildEmpty(),
              _buildEmpty(),
              _buildDot(),
              _buildEmpty(),
            ],
          ),
          Row(
            children: [
              _buildEmpty(),
              _buildDot(),
              _buildEmpty(),
              _buildEmpty(),
            ],
          ),
          Row(
            children: [
              _buildDot(),
              _buildEmpty(),
              _buildEmpty(),
              _buildEmpty(),
            ],
          ),
          Row(
            children: [
              _buildDot(),
              _buildDot(),
              _buildDot(),
              _buildDot(),
              //
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(_borderRadius)),
        border: Border.all(color: _borderColor, width: _borderWidth),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(width: _size, height: _size);
  }
}
