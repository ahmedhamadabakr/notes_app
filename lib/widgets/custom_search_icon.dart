import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: () {},
      icon: Icon(Icons.search),
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color.fromARGB(98, 158, 158, 158))),
    );
  }
}