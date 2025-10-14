import 'package:flutter/material.dart';

class SizedBoxGeneral extends StatelessWidget {
  final String labelText;
  final String hintText;

  const SizedBoxGeneral({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 70,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
