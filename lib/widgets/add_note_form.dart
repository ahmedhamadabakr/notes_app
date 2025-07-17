import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextField(
              hint: 'Title',
              onSave: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Content',
              maxLines: 5,
              onSave: (value) {
                content = value;
              },
            ),
            const SizedBox(height: 32),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  var noteModel = NoteModel(
                    Colors.blue.value,
                    title: title!,
                    content: content!,
                    date: DateTime.now().toString(),
                  );

                  BlocProvider.of<NotesCubit>(context).addnote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
