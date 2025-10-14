import 'package:flutter/material.dart';

class CustomButtonStyles {

  static const ButtonStyle botonesDefecto = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(185, 184, 184, 1)),
    fixedSize: MaterialStatePropertyAll(Size(270, 50)),
    textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white, fontSize: 20)),
    //side: MaterialStatePropertyAll(BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2)),
    //shadowColor: MaterialStatePropertyAll(Color.fromARGB(255, 255, 255, 255)),
    overlayColor: MaterialStatePropertyAll(Color.fromARGB(255, 124, 125, 126)),
  );
}