import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/model/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNoteState> {
  AddNotesCubit() : super(AddNoteInitial());

  Color? color = Color(0xffBCE784);

  addnote(NoteModel note) async {
    note.color = color!.toARGB32();
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotsBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
