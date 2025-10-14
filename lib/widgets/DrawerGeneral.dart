import 'package:cuadernotema1/screens/PantallaPrincipal.dart';
import 'package:cuadernotema1/screens/Perfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DrawerGeneral extends StatefulWidget {
  const DrawerGeneral({super.key});

  @override
  State<DrawerGeneral> createState() => _DrawergeneralState();
}
class _DrawergeneralState extends State<DrawerGeneral> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            alignment: Alignment.center,
            child: Text('Menú', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
              ),
          ),

          //PANTALLA PRINCIPAL
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Pantalla Principal'),
            onTap: () {
              Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => const PantallaPrincipal() //Ruta a la pagina Principal
          
          ),
          );
            },
          ),
 
        
          //PERFIL
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Mi perfil'),
            onTap: () {
              Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => const Perfil() //Ira la ruta hacia un supuesto perfil, todavia sin crear
          
          ),
          );
            },
          ),

          //SALIR
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Salir'),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}