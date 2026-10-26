class Modulo {
  String _nombre;
  int _cantidadRA;
  int _horas;

  Modulo(this._nombre, this._cantidadRA, this._horas);

  String get nombre => _nombre;
  set nombre(String nombre) => _nombre = nombre;

  int get cantidadRA => _cantidadRA;
  set cantidadRA(int cantidadRA) => _cantidadRA = cantidadRA;

  int get horas => _horas;
  set horas(int horas) => _horas = horas;

  @override
  String toString() => '$nombre: $cantidadRA - ($horas horas)';
}
