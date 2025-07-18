import 'package:flutter/material.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/widgets/add_note_button_sheet.dart';
import 'package:notesapp/widgets/notes_view_body.dart';
import 'package:notesapp/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: BlocProvider.of<AddNotesCubit>(context),
                  child: const AddNoteButtonSheet(),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
        body: const NotesViewBody(),
      ),
    );
  }
}
