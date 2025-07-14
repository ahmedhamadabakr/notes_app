import 'package:flutter/material.dart';
import 'package:notesapp/widgets/edit_note_views_body.dart';

class EditNoteViews extends StatelessWidget {
  const EditNoteViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewsBody());
  }
}
