class Usuario {
  final String tratamiento;
  final String nombre;
  final String contrasenya;
  final String contrasenya2;
  final String edad;
  final String ciudad;

  Usuario({
    required this.tratamiento,
    required this.nombre,
    required this.contrasenya,
    required this.contrasenya2,
    required this.edad,
    required this.ciudad,
  });

 
  static Usuario admin() {
    return Usuario(
      tratamiento: '',
      nombre: 'admin',
      contrasenya: 'admin',
      contrasenya2: 'admin',
      edad: '',
      ciudad: '',
    );
  }

  @override
  String toString() {
    return 'Usuario --> tratamiento: $tratamiento, nombre: $nombre, edad: $edad, ciudad: $ciudad';
  }
}
