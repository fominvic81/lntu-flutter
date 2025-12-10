import 'package:flutter/material.dart';
import 'package:lntu_flutter/widgets/preview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _fontSize = 16;
  final TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _text,
              decoration: InputDecoration(
                labelText: "Text",
                hintText: "Hello world",
              ),
            ),
            Row(
              children: [
                Text("Font size $_fontSize"),
                Expanded(
                  child: Slider(
                    value: _fontSize.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        _fontSize = value.floor();
                      });
                    },
                    min: 10,
                    max: 100,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final confirmed =
                    await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PreviewScreen(
                              text: _text.text,
                              fontSize: _fontSize,
                            ),
                          ),
                        )
                        as bool?;

                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: Image.asset(
                        'assets/images/robot.png',
                        width: 50,
                        height: 50,
                      ),
                      content: Text(
                        confirmed == null
                            ? "Don't know what to say"
                            : (confirmed == true
                                  ? "Cool!"
                                  : "Let's try something else"),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Preview"),
            ),
          ],
        ),
      ),
    );
  }
}
