import 'package:cuadernotema1/services/ListaUsuarios.dart';
import 'package:flutter/material.dart';
import '../widgets/DrawerGeneral.dart';
import 'package:cuadernotema1/widgets/AppBarGeneral.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarios = ListaUsuarios.all;

    return Scaffold(
      drawer: usuarios.isEmpty ? null : DrawerGeneral(),
      appBar: AppBarGeneral(titulo:'Mi Perfil'),
      body: SingleChildScrollView(
        child: Center(
        child: Builder(
          builder: (context) {
            if (usuarios.isEmpty) {
              return const Text('No hay usuario registrado');
            }
            final usuario = usuarios.last;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tratamiento: ${usuario.tratamiento}'),
                Text('Nombre: ${usuario.nombre}'),
                Text('Contraseña: ${usuario.contrasenya}'),
                Text('Edad: ${usuario.edad}'),
                Text('Ciudad: ${usuario.ciudad}'),
              ],
            );
          },
        ),
      ),
    ),
    );
  }
}
