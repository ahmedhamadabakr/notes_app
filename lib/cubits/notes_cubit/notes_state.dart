part of 'notes_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> noteModel;

  NoteSuccess({required this.noteModel});
}

class NoteFailure extends NoteState {
  final String errMessage;

  NoteFailure(this.errMessage);
}
