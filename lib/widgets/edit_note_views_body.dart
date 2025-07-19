import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widgets/colors.listview.dart';
import 'package:notesapp/widgets/custom_appbar_widget.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

class EditNoteViewsBody extends StatefulWidget {
  const EditNoteViewsBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewsBody> createState() => _EditNoteViewsBodyState();
}

class _EditNoteViewsBodyState extends State<EditNoteViewsBody> {
  String? title, content;

  DateTime now = DateTime.now();
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('dd-MM-yyyy – hh:mm').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.date = formattedDate;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              Navigator.pop(context);
            },
          ),
          CustomTextField(
            hint: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hint: widget.note.content,
            maxLines: 5,

            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 20),

          ColorsListView(),
        ],
      ),
    );
  }
}
