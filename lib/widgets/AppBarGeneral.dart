import 'package:flutter/material.dart';

class AppBarGeneral extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const AppBarGeneral({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      title: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            titulo,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
