
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitial());

  List<NoteModel>? filteredNotes;
  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotsBox);

    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      filteredNotes = notes;
    } else {
      filteredNotes = notes!
          .where((note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(NotesSuccess());
  }
}
