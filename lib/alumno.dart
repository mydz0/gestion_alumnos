import 'package:gestion_alumnos/modulo.dart';

class Alumno {
  String _nombre;
  String _apellidos;
  String _dni;
  int _edad;
  List<Modulo> _modulos;
  bool _repetidor;

  Alumno(
    this._nombre,
    this._apellidos,
    this._dni,
    this._edad,
    this._modulos,
    this._repetidor,
  );

  String get nombre => _nombre;
  set nombre(String nombre) => _nombre = nombre;

  String get apellidos => _apellidos;
  set apellidos(String apellidos) => _apellidos = apellidos;

  String get dni => _dni;
  set dni(String dni) => _dni = dni;

  int get edad => _edad;
  set edad(int edad) => _edad = edad;

  List<Modulo> get modulos => _modulos;
  set modulos(List<Modulo> modulos) => _modulos = modulos;

  bool get repetidor => _repetidor;
  set repetidor(bool repetidor) => _repetidor = repetidor;

  @override
  String toString() =>
      '$_nombre $_apellidos ($_edad) - $_dni: $_modulos${_repetidor ? ' (repetidor)' : ''}';
}
