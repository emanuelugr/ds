import 'package:ej4_creador_personajes/Razas/Personaje.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class GestorPersonajes {
  static GestorPersonajes? instancia;
  List<Personaje> personajes = [];
  final String apiUrl = "http://localhost:3000/personajes";

  GestorPersonajes._();

  static GestorPersonajes getInstancia() {
    instancia ??= GestorPersonajes._();
    return instancia!;
  }

  Future<void> cargarPersonajes(String usuario) async {
    final response = await http.get(Uri.parse('$apiUrl?usuario=$usuario'));
    if (response.statusCode == 200) {
      List<dynamic> personajesJson = json.decode(response.body);

      personajes.clear();
      personajes.addAll(
          personajesJson.map((json) => Personaje.fromJson(json)).toList());
    } else {
      throw Exception('Error al cargar personajes');
    }
  }

  Future<void> agregar(Personaje personaje) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(personaje.toJson()),
    );
    if (response.statusCode == 201) {
      personajes.add(Personaje.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to add task: ${response.body}');
    }
  }

  Future<void> eliminar(Personaje personaje) async {
    final response = await http.delete(
      //Uri.parse('$apiUrl?usuario=$usuario&id=$id')
      //Uri.parse('$apiUrl?usuario=$usuario'),
      Uri.parse('$apiUrl/${personaje.id}'),
    );
    if (response.statusCode == 200) {
      personajes.removeWhere((t) => t.id == personaje.id);
    } else {
      throw Exception('Failed to delete personaje $response.statusCode)');
    }
  }

  Future<void> cambiarNombre(Personaje personaje, String nombre) async {
    final response = await http.patch(
      Uri.parse('$apiUrl/${personaje.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'nombre': nombre,
      }),
    );

    if (response.statusCode == 200) {
      personaje.nombre = nombre;
    } else {
      throw Exception('Error al actualizar personaje');
    }
  }

  void addPersonaje(Personaje p) {
    personajes.add(p);
    //agregar(p);
  }

  int getLength() {
    return personajes.length;
  }

  Personaje getPersonaje(int id) {
    if (id >= 0 && id < personajes.length) {
      return personajes[id];
    } else {
      throw "Id incorrecto";
    }
  }

  void remPersonaje(int id) {
    if (id >= 0 && id < personajes.length) {
      personajes.removeAt(id);
    } else {
      throw "Id incorrecto";
    }
  }

  //Ordenar el personaje según su tipo
  void ordenarPersonaje(bool ascen, String tipo, [String atributo = ""]) {
    List<Personaje> copiaPersonajes = List.from(personajes);

    switch (tipo) {
      case "nombre":
        if (ascen) {
          copiaPersonajes.sort((a, b) => a.nombre.compareTo(b.nombre));
        } else {
          copiaPersonajes.sort((a, b) => b.nombre.compareTo(a.nombre));
        }
        break;
      case "raza":
        if (ascen) {
          copiaPersonajes.sort((a, b) => a.raza.compareTo(b.raza));
        } else {
          copiaPersonajes.sort((a, b) => b.raza.compareTo(a.raza));
        }
        break;
      case "clase":
        if (ascen) {
          copiaPersonajes.sort((a, b) => a.clase.compareTo(b.clase));
        } else {
          copiaPersonajes.sort((a, b) => b.clase.compareTo(a.clase));
        }
        break;
      case "atributo":
        if (ascen) {
          copiaPersonajes.sort((a, b) =>
              a.secondaryAttr[atributo]!.compareTo(b.secondaryAttr[atributo]!));
        } else {
          copiaPersonajes.sort((a, b) =>
              b.secondaryAttr[atributo]!.compareTo(a.secondaryAttr[atributo]!));
        }
        break;
    }

    personajes = copiaPersonajes;
  }

  List<Personaje> filtrarPorRaza(String filtroRaza) {
    List<Personaje> copiaPersonajes = List.from(personajes);

    return copiaPersonajes.where((p) => p.raza == filtroRaza).toList();
  }

  List<Personaje> filtrarPorClase(String filtroClase) {
    List<Personaje> copiaPersonajes = List.from(personajes);

    return copiaPersonajes.where((p) => p.clase == filtroClase).toList();
  }
}
