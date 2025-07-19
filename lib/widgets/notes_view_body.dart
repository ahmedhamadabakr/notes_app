import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/widgets/custom_appbar_widget.dart';
import 'package:notesapp/widgets/custom_text_field.dart';
import 'package:notesapp/widgets/notes_listview.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        CustomAppBar(
          title: 'Notes',
          icon: Icons.search,
          onPressed: () {
            setState(() {
              isActive = true;
            });
          },
        ),
        if (isActive)
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
            child: CustomTextField(
              hint: 'search with Title',
              prefixIcon: Icon(Icons.search),
              onChanged: (value) {
                if (value == null || value.isEmpty) {
                  BlocProvider.of<NotesCubit>(context).searchNotes('');
                } else {
                  BlocProvider.of<NotesCubit>(context).searchNotes(value);
                }
              },
            ),
          ),
        const Expanded(child: NotesListView()),
      ],
    );
  }
}
