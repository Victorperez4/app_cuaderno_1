import 'package:cuadernotema1/screens/PantallaPrincipal.dart';
import 'package:cuadernotema1/widgets/AppBarGeneral.dart';
import 'package:flutter/material.dart';
import '../widgets/DrawerGeneral.dart';
import 'package:cuadernotema1/config/common/utils/Button_styles.dart';


class PantallaSecundaria extends StatefulWidget {
  const PantallaSecundaria({super.key});

  @override
  State<PantallaSecundaria> createState() => _PantallaSecundariaState();
}

class _PantallaSecundariaState extends State<PantallaSecundaria> {

  void _pantallaPrincipal (){
    Navigator.push(
      context,
       MaterialPageRoute(builder: (context) => PantallaPrincipal()),
       );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: DrawerGeneral(),
      
      appBar: AppBarGeneral(titulo:'Pantalla Secundaria'), /*La barra de encima de la pagina/ aplicacion*/
           
     body: SingleChildScrollView(
  child: Center(
    child: Column(
      children: [
        SizedBox(height: 200),
        ElevatedButton(
          style: CustomButtonStyles.botonesDefecto,
          onPressed: _pantallaPrincipal,
          child: Text("Salir"),
        ),
      ],
    ),
  ),
),
    );
  }
}
