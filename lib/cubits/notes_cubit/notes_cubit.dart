import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitial());

  fetchAllNotes() async {
    try {
      var notesBox = Hive.box<NoteModel>(kNotsBox);

      emit(NoteSuccess(noteModel: notesBox.values.toList()));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
