import 'package:flutter/material.dart';
import 'package:lntu_flutter/models/Note.dart';
import 'package:lntu_flutter/validators/note_title.dart';

class NoteWidget extends StatelessWidget {
  final Note note;

  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final createdAt = note.createdAt;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.cyanAccent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(note.title, style: TextStyle(fontSize: 25),),
            Text(
              "${createdAt.day}.${createdAt.month}.${createdAt.year} ${createdAt.hour}:${createdAt.minute}:${createdAt.second}",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
