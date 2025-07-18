import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: onPressed,
      icon: Icon(icon),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          const Color.fromARGB(98, 158, 158, 158),
        ),
      ),
    );
  }
}
