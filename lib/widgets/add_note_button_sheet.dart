import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:notesapp/widgets/add_note_form.dart';
import 'dart:math';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotesCubit(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: max(0, MediaQuery.of(context).viewInsets.bottom),
        ),
        child: BlocConsumer<NotesCubit, AddNoteState>(
          listener: (BuildContext context, state) {
            if (state is AddNoteFailure) {
              print("errrrorrrr  :  ${state.errMessage}");
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (BuildContext context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false,

              child: const SingleChildScrollView(child: AddNoteForm()),
            );
          },
        ),
      ),
    );
  }
}
