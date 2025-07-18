import 'package:flutter/material.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/views/edit_note_views.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EditNoteViews();
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 12),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Text(
                note.content,
                style: const TextStyle(
                  color: Color.fromARGB(255, 148, 187, 207),
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                },
                icon: Icon(Icons.delete),
                style: ButtonStyle(
                  iconColor: WidgetStateProperty.all(Colors.black),
                  iconSize: WidgetStatePropertyAll(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 16),
              child: Text(
                note.date,
                style: const TextStyle(color: Color.fromARGB(106, 0, 0, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
