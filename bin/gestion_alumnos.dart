import 'dart:convert';
import 'dart:io';

import 'package:gestion_alumnos/alumno.dart';
import 'package:gestion_alumnos/modulo.dart';

String? leerLinea() => stdin.readLineSync(encoding: utf8);

int? leerEntero() {
  String? linea = leerLinea();
  if (linea == null) return null;
  return int.tryParse(linea);
}

final Map<String, Modulo> modulos = {
  'M01': Modulo('Programación', 5, 231),
  'M02': Modulo('Bases de Datos', 6, 165),
  'M03': Modulo('Lenguajes de Marcas', 4, 99),
  'M04': Modulo('Entornos de Desarrollo', 5, 99),
  'M05': Modulo('Sistemas Informáticos', 5, 165),
  'M06': Modulo('Acceso a Datos', 6, 132),
  'M07': Modulo('Desarrollo de Interfaces', 5, 132),
  'M08': Modulo('Programación Multimedia', 4, 99),
  'M09': Modulo('Programación de Servicios', 5, 88),
  'M10': Modulo('Sistemas de Gestión Empresarial', 4, 88),
  'M11': Modulo('Formación y Orientación Laboral', 4, 99),
  'M12': Modulo('Inglés Técnico', 3, 66),
};

final List<Alumno> alumnos = [
  Alumno('Lucía', 'García Martínez', '12345678A', 18, [
    modulos['M01']!,
    modulos['M02']!,
  ], false),
  Alumno('Marc', 'Soler Vidal', '87654321B', 22, [
    modulos['M11']!,
    modulos['M03']!,
    modulos['M10']!,
    modulos['M02']!,
    modulos['M05']!,
  ], false),
  Alumno('Sofía', 'Rodríguez Pérez', '34567890C', 20, [
    modulos['M01']!,
    modulos['M02']!,
    modulos['M03']!,
    modulos['M04']!,
    modulos['M05']!,
    modulos['M06']!,
    modulos['M07']!,
  ], true),
  Alumno('Hugo', 'Sánchez Gómez', '45678901D', 18, [modulos['M12']!], false),
  Alumno('Martina', 'Jiménez Ruiz', '56789012E', 21, [
    modulos['M09']!,
    modulos['M10']!,
    modulos['M11']!,
    modulos['M12']!,
  ], true),
  Alumno('Daniel', 'Hernández Díaz', '67890123F', 19, [
    modulos['M01']!,
    modulos['M02']!,
    modulos['M06']!,
  ], false),
  Alumno('Valeria', 'Moreno Álvarez', '78901234G', 18, [
    modulos['M03']!,
    modulos['M04']!,
    modulos['M05']!,
    modulos['M06']!,
    modulos['M07']!,
    modulos['M08']!,
  ], false),
  Alumno('Álvaro', 'Muñoz Romero', '89012345H', 23, [
    modulos['M01']!,
    modulos['M02']!,
  ], true),
  Alumno('Carla', 'Alonso Gutiérrez', '90123456J', 19, [
    modulos['M01']!,
    modulos['M08']!,
    modulos['M09']!,
    modulos['M10']!,
  ], false),
  Alumno('Pablo', 'Navarro Torres', '01234567K', 20, [
    modulos['M11']!,
    modulos['M12']!,
  ], false),
  Alumno('Elena', 'Domínguez Vázquez', '11223344L', 18, [
    modulos['M01']!,
    modulos['M02']!,
    modulos['M03']!,
    modulos['M04']!,
    modulos['M05']!,
    modulos['M06']!,
    modulos['M07']!,
    modulos['M08']!,
  ], false),
  Alumno('Adrián', 'Ramos Gil', '22334455M', 21, [modulos['M01']!], true),
  Alumno('Noa', 'Serrano Blanco', '33445566N', 19, [
    modulos['M03']!,
    modulos['M05']!,
    modulos['M07']!,
    modulos['M09']!,
  ], false),
  Alumno('Diego', 'Castro Suárez', '44556677P', 20, [
    modulos['M02']!,
    modulos['M08']!,
    modulos['M10']!,
    modulos['M11']!,
    modulos['M12']!,
  ], false),
  Alumno('Alba', 'Ortega Molina', '55667788Q', 18, [
    modulos['M01']!,
    modulos['M02']!,
    modulos['M03']!,
  ], false),
  Alumno('Marcos', 'Delgado Cano', '66778899R', 24, [
    modulos['M04']!,
    modulos['M06']!,
  ], true),
  Alumno('Julia', 'Vega Herrera', '77889900S', 19, [
    modulos['M01']!,
    modulos['M02']!,
    modulos['M03']!,
    modulos['M04']!,
    modulos['M05']!,
    modulos['M06']!,
    modulos['M07']!,
    modulos['M08']!,
    modulos['M09']!,
  ], false),
  Alumno('Iván', 'Reyes Peña', '88990011T', 20, [
    modulos['M07']!,
    modulos['M11']!,
  ], false),
  Alumno('Paula', 'Marín Flores', '99001122V', 18, [
    modulos['M01']!,
    modulos['M04']!,
    modulos['M10']!,
    modulos['M12']!,
  ], false),
  Alumno('Nicolás', 'Cruz Guerrero', '10111213W', 22, [
    modulos['M02']!,
    modulos['M03']!,
    modulos['M05']!,
    modulos['M06']!,
    modulos['M08']!,
    modulos['M09']!,
  ], true),
];

void main(List<String> arguments) {
  bool exit = false;

  do {
    print("===========================");
    print("Escoja una opción");
    print("===========================");
    print("1) Mostrar alumnos");
    print("2) Mostrar módulos");
    print("3) Ordenar módulos");
    print("4) Buscar módulo");
    print("5) Validar número de módulos");
    print("6) Salir");

    String? lineaOpcion = leerLinea();
    if (lineaOpcion == null) {
      exit = true;
      continue;
    }
    int? opcion = int.tryParse(lineaOpcion);
    if (opcion == null) {
      print("Opción inválida, introduzca un número.");
      continue;
    }

    switch (opcion) {
      case 1:
        mostrarAlumnos();
        break;
      case 2:
        mostrarModulos();
        break;
      case 3:
        {
          print("Inserte nombre de alumno: ");
          String? nombre = leerLinea();
          if (nombre == null) {
            exit = true;
            break;
          }
          Alumno? alumno = buscarAlumno(nombre);
          if (alumno == null) {
            print("Alumno no encontrado");
          } else {
            ordenarModulos(alumno);
          }
        }
        break;
      case 4:
        {
          print("Inserte nombre de alumno: ");
          String? nombre = leerLinea();
          if (nombre == null) {
            exit = true;
            break;
          }
          Alumno? alumno = buscarAlumno(nombre);
          if (alumno == null) {
            print("Alumno no encontrado");
            break;
          }
          print("Inserte módulo: ");
          String? nombreModulo = leerLinea();
          if (nombreModulo == null) {
            exit = true;
            break;
          }
          buscarModulo(alumno, nombreModulo);
        }
        break;
      case 5:
        {
          print("Inserte nombre de alumno: ");
          String? nombre = leerLinea();
          if (nombre == null) {
            exit = true;
            break;
          }
          Alumno? alumno = buscarAlumno(nombre);
          if (alumno == null) {
            print("Alumno no encontrado");
          } else {
            validarNumeroDeModulos(alumno);
          }
        }
        break;
      case 6:
        exit = true;
        break;
      default:
        print("Opción fuera de rango.");
    }
  } while (!exit);
}

List<Alumno> mostrarAlumnos() {
  List<Alumno> listaAlumnos = List.from(alumnos);
  listaAlumnos.forEach(
    (a) => print('${a.nombre} ${a.apellidos} | ${a.edad} | ${a.dni}'),
  );

  return listaAlumnos;
}

Map<String, Modulo> mostrarModulos() {
  Map<String, Modulo> listaModulos = Map.from(modulos);
  listaModulos.forEach(((key, value) => print('$key: $value')));
  return listaModulos;
}

String codigoDe(Modulo m) => modulos.entries
    .firstWhere(
      (e) => identical(e.value, m),
      orElse: () => MapEntry(m.nombre, m),
    )
    .key;

String formatearModulos(List<Modulo> lista) =>
    '[${lista.map((m) => '${codigoDe(m)}: ${m.cantidadRA} - (${m.horas} horas)').join(', ')}]';

void ordenarModulos(Alumno alumno) {
  print("Lista original: ${formatearModulos(alumno.modulos)}");

  alumno.modulos.sort((a, b) => codigoDe(a).compareTo(codigoDe(b)));
  print("Lista ordenada: ${formatearModulos(alumno.modulos)}");
}

bool buscarModulo(Alumno alumno, String nombreModulo) {
  alumno.modulos;

  if (alumno.modulos.any((m) => m.nombre == nombreModulo)) {
    print("Módulo encontrado");
    return true;
  } else {
    print("Módulo no encontrado");
    return false;
  }
}

void validarNumeroDeModulos(Alumno alumno) {
  if (alumno.modulos.length >= 4) {
    print("Curso completo");
    return;
  }

  while (alumno.modulos.length < 4) {
    print("Introduzca nombre de módulo:");
    String? nombreModulo = leerLinea();
    if (nombreModulo == null) return;
    if (nombreModulo.isEmpty) continue;

    if (alumno.modulos.any((m) => m.nombre == nombreModulo)) {
      print("Módulo ya existe, introduzca uno diferente");
      continue;
    }

    print("Introduzca cantidad de RA:");
    String? lineaRA = leerLinea();
    if (lineaRA == null) return;
    int? cantidadRA = int.tryParse(lineaRA);
    if (cantidadRA == null) {
      print("Cantidad de RA inválida, inténtelo de nuevo.");
      continue;
    }

    print("Introduzca horas:");
    String? lineaHoras = leerLinea();
    if (lineaHoras == null) return;
    int? horas = int.tryParse(lineaHoras);
    if (horas == null) {
      print("Horas inválidas, inténtelo de nuevo.");
      continue;
    }

    alumno.modulos.add(Modulo(nombreModulo, cantidadRA, horas));
    print("Módulo añadido correctamente.");

    if (alumno.modulos.length >= 4) {
      print("Curso completo");
      break;
    }

    print("¿Qué desea hacer?");
    print("1. Guardar cambios");
    print("2. Seguir añadiendo módulos");
    String? opcion = leerLinea();
    if (opcion == null) return;

    if (opcion == "1") {
      print("Cambios guardados.");
      break;
    }
  }
}

Alumno? buscarAlumno(String nombre) {
  try {
    return alumnos.firstWhere((a) => a.nombre == nombre);
  } catch (e) {
    return null;
  }
}
