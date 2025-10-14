import 'package:cuadernotema1/config/common/utils/Button_styles.dart';
import 'package:flutter/material.dart';
import 'FormularioRegistro.dart';
import '../widgets/DrawerGeneral.dart';
import '../widgets/AppBarGeneral.dart';
import 'package:cuadernotema1/screens/PantallaSecundaria.dart';
import '../widgets/SizedBoxGeneral.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {

  void _formularioRegistro (){
    Navigator.push(
      context,
       MaterialPageRoute(builder: (context) => FormularioRegistro()),
       );
     }  

    void _pantallaSecundaria (){
    Navigator.push(
      context,
       MaterialPageRoute(builder: (context) => PantallaSecundaria()),
       );

 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: DrawerGeneral(),

appBar: AppBarGeneral(titulo: "Pantalla Principal"),

      body:    SingleChildScrollView(
        child: 
          Center(
            child: Column(
              children: [
            SizedBox(
              width: 50,
              height: 20,), 
            Image.asset(
              'assets/images/pikachu.png'),
            
            SizedBox(
              width: 50,
              height: 20,), 

            SizedBoxGeneral(
              labelText: 'Nombre',
              hintText: 'Escribe aquí',
            ),

              SizedBoxGeneral(
              labelText: 'Contraseña',
              hintText: 'Escribe aquí',
            ),


            ElevatedButton(
              style: CustomButtonStyles.botonesDefecto,
               onPressed: _pantallaSecundaria,
               child: Text( "Iniciar Sesión")
              ),
              
              SizedBox(height: 12), /* Separacion entre botones (12px) (const porque es una constante) (SizedBox es una caja vacia que ocupa espacio) (height porque es vertical)*/
              

            ElevatedButton(
              style: CustomButtonStyles.botonesDefecto,
               onPressed: _formularioRegistro,
               child: Text( "Registrarse")
              ),
              
          ],
        ),
      ),
    ),
    );
  }
}
