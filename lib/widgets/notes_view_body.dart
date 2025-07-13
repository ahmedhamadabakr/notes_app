import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_appbar_widget.dart';

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
      margin: EdgeInsets.all(12),
      padding: const EdgeInsets.only(top: 24, bottom: 24,left: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              'Flutte tips',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: Text(
              'Build your career with flutter tech',
              style: TextStyle(
                color: const Color.fromARGB(255, 148, 187, 207),
                fontSize: 18,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.black),
                iconSize: WidgetStatePropertyAll(35),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20,top: 16),
            child: Text(
              DateTime.now().toString(),
              style: TextStyle(color: const Color.fromARGB(106, 0, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }
}
