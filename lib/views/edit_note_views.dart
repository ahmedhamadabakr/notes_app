import 'package:flutter/material.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widgets/edit_note_views_body.dart';

class EditNoteViews extends StatelessWidget {
  const EditNoteViews({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewsBody(note: note));
  }
}
