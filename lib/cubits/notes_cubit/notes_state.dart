part of 'notes_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}
class NotesSuccess extends NoteState {}
