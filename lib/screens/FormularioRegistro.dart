import 'dart:io';
import 'package:cuadernotema1/config/common/utils/Button_styles.dart';
import 'package:flutter/material.dart';
import 'package:cuadernotema1/screens/PantallaPrincipal.dart';
import 'package:cuadernotema1/widgets/DrawerGeneral.dart';
import 'package:cuadernotema1/models/Usuario.dart';
import 'package:cuadernotema1/services/ListaUsuarios.dart';
import 'package:cuadernotema1/config/common/utils/CargarImagen.dart';
import 'package:cuadernotema1/widgets/AppBarGeneral.dart';

class FormularioRegistro extends StatefulWidget {
  const FormularioRegistro({super.key});

  @override
  State<FormularioRegistro> createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  final TextEditingController _textController = TextEditingController();
  bool _acceptedTerms = false;
  String _nombre = '';
  String _contrasenya = '';
  String _contrasenya2 = '';
  String _edad = '';
  String? _fotoPath;
  String? _ciudadSeleccionada;
  final List<String> _ciudades = [
    'A Coruña',
    'Albacete',
    'Alicante',
    'Almería',
    'Ávila',
    'Badajoz',
    'Barcelona',
    'Bilbao',
    'Burgos',
    'Cáceres',
    'Cádiz',
    'Castellón de la Plana',
    'Ceuta',
    'Ciudad Real',
    'Córdoba',
    'Cuenca',
    'Girona',
    'Granada',
    'Guadalajara',
    'Huelva',
    'Huesca',
    'Jaén',
    'Las Palmas de Gran Canaria',
    'León',
    'Lleida',
    'Logroño',
    'Lugo',
    'Madrid',
    'Málaga',
    'Melilla',
    'Murcia',
    'Ourense',
    'Oviedo',
    'Palma',
    'Pamplona',
    'Pontevedra',
    'Salamanca',
    'San Sebastián',
    'Santa Cruz de Tenerife',
    'Segovia',
    'Sevilla',
    'Soria',
    'Tarragona',
    'Teruel',
    'Toledo',
    'Valencia',
    'Valladolid',
    'Vitoria-Gasteiz',
    'Zamora',
    'Zaragoza',
  ];
  String? _tratamientoSeleccionado = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _pantallaPrincipal() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PantallaPrincipal()),
    );
  }

  void _aceptar() {
    final isFormValid = _formKey.currentState!.validate();
    
    if (isFormValid) {
      
      Usuario nuevoUsuario = Usuario(
        tratamiento: _tratamientoSeleccionado ?? '',   
        nombre: _nombre,
        contrasenya: _contrasenya,
        contrasenya2: _contrasenya2,
        edad: _edad,
        ciudad: _ciudadSeleccionada ?? '',
      );

      ListaUsuarios.add(nuevoUsuario);

      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Usuario guardado correctamente')),
    );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantallaPrincipal()),
      );
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Por favor, completa todos los campos correctamente')),
  );
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerGeneral(),
      appBar: AppBarGeneral(titulo:'Formulario de Registro'),


body: SingleChildScrollView(
  
  child: Center(
    child: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox( 
            width: 500,
            height: 70,),

          SizedBox(
            width: 500,
            child: Center( // Centra horizontalmente el contenido dentro del SizedBox
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Tratamiento:',
                  ),
                  const SizedBox(width: 30),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Sr.',
                        groupValue: _tratamientoSeleccionado,
                        onChanged: (value) {
                          setState(() {
                            _tratamientoSeleccionado = value;
                          });
                        },
                      ),
                      const Text('Sr.'),
                    ],
                  ),
                  SizedBox(width: 30),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Sra.',
                        groupValue: _tratamientoSeleccionado,
                        onChanged: (value) {
                          setState(() {
                            _tratamientoSeleccionado = value;
                          });
                        },
                      ),
                      const Text('Sra.'),
                    ],
                  ),
                ],
              ),
            ),
          ),

         SizedBox( //NOMBRE
            width: 200,
            height: 30,),

              SizedBox( //NOMBRE
                width: 500,
                height: 70,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    hintText: 'Escribe aquí',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _nombre = value;
                  },
                ),
              ),

              SizedBox( //CONTRASEÑA
                width: 500,
                height: 70,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, pon una contraseña';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _contrasenya = value;
                  },
                ),
              ),

              SizedBox( //REPETIR CONTRASEÑA
                width: 500,
                height: 70,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Repite la contraseña',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!=_contrasenya ) {
                      return 'Las contraseñas no coinciden';
                    }if (value == null || value.isEmpty || value!=_contrasenya ) {
                      return 'Por favor, repite tu contraseña';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _contrasenya2 = value;
                  },
                ),
              ),



              SizedBox( //FOTO
                height: 20,
                child: _fotoPath != null
                    ? Image.file(
                        File(_fotoPath!),
                        fit: BoxFit.cover,
                      )
                    : const Text('No hay foto seleccionada'),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.image),
                    tooltip: 'Seleccionar de galería',
                    onPressed: () async {
                      final path = await CameraGalleryService().selectPhoto();
                      if (path == null) return;
                      setState(() {
                        _fotoPath = path;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    tooltip: 'Tomar una foto',
                    onPressed: () async {
                      final path = await CameraGalleryService().takePhoto();
                      if (path == null) return;
                      setState(() {
                        _fotoPath = path;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),


              SizedBox( //EDAD
                width: 500,
                height: 70,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Edad',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu edad';
                    }
                    final age = int.tryParse(value);
                    if (age == null || age <= 0 || age > 100) {
                      return 'Por favor, ingresa una edad válida';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _edad = value;
                  },
                ),
              ),

              const SizedBox(height: 12),


              SizedBox( //CIUDAD
                width: 500,
                height: 80,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Ciudad',
                    border: OutlineInputBorder(),
                  ),
                  value: _ciudadSeleccionada,
                  items: _ciudades.map((String ciudad) {
                    return DropdownMenuItem<String>(
                      value: ciudad,
                      child: Text(ciudad),
                    );
                  }).toList(),
                  onChanged: (String? nuevaCiudad) {
                    setState(() {
                      _ciudadSeleccionada = nuevaCiudad;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, selecciona una ciudad';
                    }
                    return null;
                  },
                ),
              ),


              Center( //CHECKBOX
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Acepto los términos y condiciones'),
                    const SizedBox(width: 8),
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _acceptedTerms = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

           ElevatedButton(
                  style: CustomButtonStyles.botonesDefecto,
                  onPressed: _acceptedTerms ? _aceptar : null,
                  child: const Text('Registrar'),
           ),
              const SizedBox(height: 12),

           ElevatedButton(
                  style: CustomButtonStyles.botonesDefecto,
                  onPressed: _acceptedTerms ? _pantallaPrincipal : null,
                  child: const Text('Ir a Pantalla Principal'),
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
