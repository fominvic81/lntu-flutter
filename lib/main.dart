import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lntu_flutter/db.dart';
import 'package:lntu_flutter/models/Note.dart';
import 'package:lntu_flutter/widgets/create_note_form.dart';
import 'package:lntu_flutter/widgets/note.dart';
import 'package:sqflite/sqflite.dart';

final dio = Dio();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.cyanAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationThemeData(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var notes = <Note>[];

  @override
  void initState() {
    super.initState();

    _loadNotes();
  }

  void _loadNotes() async {
    final db = await openDB();

    final results = await db.rawQuery("SELECT title, created_at FROM notes ORDER BY id DESC");

    setState(() {
      for (final note in results) {
        notes = [
          ...notes,
          Note(
            title: note["title"] as String,
            createdAt: DateTime.fromMicrosecondsSinceEpoch(
              note["created_at"] as int,
            ),
          ),
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes app", textAlign: TextAlign.center)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          spacing: 10,
          children: [
            CreateNoteForm(
              onCreate: (title) async {
                setState(() {
                  notes = [
                    Note(title: title, createdAt: DateTime.now()),
                    ...notes,
                  ];
                });
                final db = await openDB();

                await db.rawInsert(
                  "INSERT INTO notes (title, created_at) VALUES (?, ?)",
                  [title, DateTime.now().microsecondsSinceEpoch],
                );
              },
            ),
            ...notes.map((note) => NoteWidget(note: note)),
          ],
        ),
      ),
    );
  }
}
