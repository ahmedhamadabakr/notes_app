import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_appbar_widget.dart';

class EditNoteViewsBody extends StatelessWidget {
  const EditNoteViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: const [
          SizedBox(height: 50),
          CustomAppBar(title: 'Edit Note', icon: Icons.check),
        ],
      ),
    );
  }
}
