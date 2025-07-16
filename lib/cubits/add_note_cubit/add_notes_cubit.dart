import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/model/note_model.dart';

part 'add_notes_state.dart';

class NotesCubit extends Cubit<AddNoteState> {
  NotesCubit() : super(AddNoteInitial());

  addnote(NoteModel note) async {
    try {
      emit(AddNoteLoading());
      var notesBox = Hive.box(kNotsBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } catch (e) {
      AddNoteFailure(e.toString());
    }
  }
}
