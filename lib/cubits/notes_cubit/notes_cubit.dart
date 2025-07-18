import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitial());

  addnote(NoteModel note) async {
    emit(NoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotsBox);
      await notesBox.add(note);
      emit(NoteSuccess(noteModel: []));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
