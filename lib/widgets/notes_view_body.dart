import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_appbar_widget.dart';
import 'package:notesapp/widgets/custom_note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const CustomAppBar(),
        NotesItem(),
        //Row(children: [Text("Flutte tips"), CustomSearchIcon()]),
      ],
    );
  }
}

