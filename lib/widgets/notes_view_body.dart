import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_appbar_widget.dart';
import 'package:notesapp/widgets/custom_search_icon.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const CustomAppBar(),
        NotesItem(),
        //Row(children: [Text("Flutte tips"), CustomSearchIcon()]),
      ],
    );
  }
}

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text('Flutte tips', style: TextStyle(color: Colors.black)),
            subtitle: Text(
              'Build your career with flutter tech',
              style: TextStyle(color: const Color.fromARGB(255, 148, 187, 207)),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text("12jul2025", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
