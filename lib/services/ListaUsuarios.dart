import 'package:cuadernotema1/models/Usuario.dart';

class ListaUsuarios {
  ListaUsuarios._(); // Clase estática, no instanciable

  static final List<Usuario> _usuarios = <Usuario>[];

  // Obtener todos los usuarios
  static List<Usuario> get all => List.unmodifiable(_usuarios);

  // Añadir un nuevo usuario
  static void add(Usuario usuario) {
    _usuarios.add(usuario);
  }

  // Usuario que ha iniciado sesión
  static Usuario? _usuarioLogueado;

  static Usuario? get usuarioLogueado => _usuarioLogueado;

  static void setUsuarioLogueado(Usuario usuario) {
    _usuarioLogueado = usuario;
  }
}
