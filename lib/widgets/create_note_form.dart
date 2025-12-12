import 'package:flutter/material.dart';
import 'package:lntu_flutter/validators/note_title.dart';

typedef OnCreateCallback = void Function(String title);

class CreateNoteForm extends StatefulWidget {
  final OnCreateCallback onCreate;

  const CreateNoteForm({super.key, required this.onCreate});

  @override
  State<CreateNoteForm> createState() => CreateNoteFormState();
}

class CreateNoteFormState extends State<CreateNoteForm> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: TextFormField(
              controller: _title,
              validator: validateNoteTitle,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onCreate(_title.text);
                _title.text = "";
              }
            },
            style: ElevatedButton.styleFrom(minimumSize: Size(0, 50)),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
