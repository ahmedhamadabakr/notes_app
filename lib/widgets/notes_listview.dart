import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NoteState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<NotesCubit>(context);
        List<NoteModel> notes = cubit.filteredNotes ?? cubit.notes!;
        notes = notes.reversed.toList();
        if (notes.isEmpty) {
          return const Center(
            child: Text('No notes yet... add now!'),
          );
        }

        return ListView.builder(
          itemCount: notes.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return NotesItem(note: notes[index]);
          },
        );
      },
    );
  }
}
