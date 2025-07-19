import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widgets/colors.listview.dart';
import 'package:notesapp/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;

  DateTime now = DateTime.now();
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('dd-MM-yyyy – hh:mm').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
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
            const ColorsListView(),
            const SizedBox(height: 32),

            BlocBuilder<AddNotesCubit, AddNoteState>(
              builder: (BuildContext context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      var noteModel = NoteModel(
                        Colors.blue.value,
                        title: title!,
                        content: content!,
                        date: formattedDate,
                      );

                      BlocProvider.of<AddNotesCubit>(
                        context,
                      ).addnote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
