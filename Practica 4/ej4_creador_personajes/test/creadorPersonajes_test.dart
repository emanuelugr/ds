import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'dart:collection';

import 'package:ej4_creador_personajes/Clases/clases.dart';
import 'package:ej4_creador_personajes/Clases/clasesbuilder.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';
import 'package:ej4_creador_personajes/Razas/razas.dart';
import 'package:ej4_creador_personajes/Razas/Personaje.dart';
import 'package:ej4_creador_personajes/fachada.dart';
import 'package:ej4_creador_personajes/gestorPersonajes.dart';
import 'package:ej4_creador_personajes/Razas/director.dart';

void main() {
  String classCfgPath = "lib/cfg/clase/";
  String raceCfgPath = "lib/cfg/raza/";
  String currentUser = "Alejandro";
  group("Creador de personajes", () {
    ClaseBuilder classBuilder = LadronBuilder();
    PersonajeBuilder perBuilder = OrcoBuilder(classBuilder);
    group("Archivos de configuracion", () {
      //Probamos que efectivamente los archivos de configuración existen
      test("Configuración de clase ", () async {
        File f = File(classCfgPath + classBuilder.clase + ".txt");
        expect(await f.exists(), true);
      });
      test("Configuración de raza ", () async {
        File f = File(raceCfgPath + perBuilder.raza + ".txt");
        expect(await f.exists(), true);
      });
    });

    //Test 1: CFG de ClaseBuilder
    group("ClaseBuilder CFG", () {
      //Probamos que la funcion CFG de ClaseBuilder funciona correctamente
      HashMap<String, double> sec = classBuilder.loadCFG();

      test("ClaseBuilder CFG: Lectura 1", () {
        expect(sec['Estamina'], 0.75);
      });
      test("ClaseBuilder CFG: Lectura 2", () {
        expect(sec['Persuasion'], 1.5);
      });
      test("ClaseBuilder CFG: Lectura 3", () {
        expect(sec['Intimidacion'], 0.5);
      });
    });

    //Test 2: CFG de PersonajeBUilder
    group("PersonajeBuilder CFG", () {
      //Probamos que la funcion CFG de ClaseBuilder funciona correctamente
      HashMap<String, double> prim = perBuilder.loadCFG();

      test("PersonajeBuilder CFG: Lectura Fuerza", () {
        expect(prim['Fuerza'], 15);
      });
      test("PersonajeBuilder CFG: Lectura Destreza", () {
        expect(prim['Destreza'], 8);
      });
      test("PersonajeBuilder CFG: Lectura Resistencia", () {
        expect(prim['Resistencia'], 13);
      });
      test("PersonajeBuilder CFG: Lectura Inteligencia", () {
        expect(prim['Inteligencia'], 6);
      });
      test("PersonajeBuilder CFG: Lectura Sabiduria", () {
        expect(prim['Sabiduria'], 4);
      });
      test("PersonajeBuilder CFG: Lectura Carisma", () {
        expect(prim['Carisma'], 3);
      });
      test("PersonajeBuilder CFG: Lectura Percepcion", () {
        expect(prim['Percepcion'], 7);
      });
    });

    //Test 3: Creacion correcta del personaje, los atributos son los correctos leidos de los archivos
    group("Creacion de personaje", () {
      HashMap<String, double> prim = perBuilder.loadCFG();
      HashMap<String, double> sec = classBuilder.loadCFG();
      perBuilder.crearPersonaje();
      Personaje per = perBuilder.getPersonaje();
      HashMap<String, double> primaryAttr = per.primaryAttr;
      HashMap<String, double> secondaryAttr = per.secondaryAttr;

      test("Atributo P Fuerza", () {
        expect(primaryAttr['Fuerza'], prim['Fuerza']);
      });
      test("Atributo P Destreza", () {
        expect(primaryAttr['Destreza'], prim['Destreza']);
      });
      test("Atributo P Resistencia", () {
        expect(primaryAttr['Resistencia'], prim['Resistencia']);
      });
      test("Atributo P Inteligencia", () {
        expect(primaryAttr['Inteligencia'], prim['Inteligencia']);
      });
      test("Atributo P Sabiduria", () {
        expect(primaryAttr['Sabiduria'], prim['Sabiduria']);
      });
      test("Atributo P Carisma", () {
        expect(primaryAttr['Carisma'], prim['Carisma']);
      });
      test("Atributo P Percepcion", () {
        expect(primaryAttr['Percepcion'], prim['Percepcion']);
      });

      test("Atributo S Vida", () {
        expect(secondaryAttr['Vida'],
            primaryAttr['Resistencia']! + primaryAttr["Fuerza"]!);
      });
      test("Atributo S Estamina", () {
        expect(
            secondaryAttr['Estamina'],
            (primaryAttr["Destreza"]! + primaryAttr["Resistencia"]!) *
                sec['Estamina']!);
      });
      test("Atributo S Mana", () {
        expect(secondaryAttr['Mana'],
            primaryAttr["Inteligencia"]! + primaryAttr["Sabiduria"]!);
      });
      test("Atributo S Persuasión", () {
        expect(
            secondaryAttr['Persuasion'],
            (primaryAttr["Carisma"]! + primaryAttr["Sabiduria"]!) *
                sec['Persuasion']!);
      });
      test("Atributo S Intimidación", () {
        expect(
            secondaryAttr['Intimidacion'],
            (primaryAttr["Fuerza"]! + primaryAttr["Carisma"]!) *
                sec['Intimidacion']!);
      });
      test("Atributo S Agilidad", () {
        expect(secondaryAttr['Agilidad'],
            primaryAttr["Destreza"]! + primaryAttr["Inteligencia"]!);
      });
      test("Atributo S Crítico", () {
        expect(secondaryAttr['Critico'],
            primaryAttr["Percepcion"]! + primaryAttr["Inteligencia"]!);
      });
      test("Atributo S Puntería", () {
        expect(secondaryAttr['Punteria'],
            primaryAttr["Destreza"]! + primaryAttr["Percepcion"]!);
      });
    });

    //Test 4: Exportacion Correcta del personaje
    group("Exportacion del estado", () {
      Director d = Director(perBuilder);
      d.crearPersonaje("EdwardGrieg", currentUser);
      var p = d.getPersonaje();

      String path = "dump_personaje.txt";
      p.ExportState(path);

      test("Exportar estado ", () async {
        File f = File(path);
        expect(await f.exists(), true);
      });
    });

    //Test 5: Funcionamiento del director
    group("Funcionamiento director", () {
      Director dir = Director(perBuilder);
      var nombre = 'Zorg';

      test('Crear Personaje', () {
        dir.crearPersonaje(nombre, currentUser);
        var personaje = dir.getPersonaje();

        expect(personaje, isInstanceOf<Personaje>());
        expect(personaje.nombre, nombre);
      });
    });

    //Test 6: Funcionamiento de la fachada
    group('Funcionamiento fachada', () {
      test('Crear Personaje', () {
        var fachada = Fachada.getInstancia();
        var builder = ElfoBuilder(MagoBuilder());
        String nombre = "Legolas";

        var personaje = fachada.crearPersonaje(builder, nombre, currentUser);

        expect(personaje, isInstanceOf<Personaje>());
        expect(personaje.nombre, nombre);
      });
    });
  });

  group("Gestor de personajes", () {
    GestorPersonajes gestor = GestorPersonajes.getInstancia();
    Director dir1 = Director(HumanoBuilder(CaballeroBuilder()));
    dir1.crearPersonaje("Alucard", currentUser);
    Director dir2 = Director(EnanoBuilder(RangerBuilder()));
    dir2.crearPersonaje("Belmont", currentUser);
    Director dir3 = Director(ElfoBuilder(MagoBuilder()));
    dir3.crearPersonaje("Cintia", currentUser);

    Director dir4 = Director(OrcoBuilder(MagoBuilder()));
    dir4.crearPersonaje("Marginado", currentUser);

    //Test 1: Se añaden personajes a la lista
    test("Añadir Personaje", () async {
      await gestor.agregar(dir1.getPersonaje());
      await gestor.agregar(dir2.getPersonaje());
      await gestor.agregar(dir3.getPersonaje());
      await gestor.agregar(dir4.getPersonaje());

      expect(gestor.getPersonaje(0).nombre, "Alucard");
      expect(gestor.getPersonaje(1).nombre, "Belmont");
      expect(gestor.getPersonaje(2).nombre, "Cintia");
      expect(gestor.getPersonaje(3).nombre, "Marginado");

      expect(gestor.personajes.length, 4);
    });

    //Test 2: Se eliminan bien los personajes
    test("Eliminar Personaje", () async {
      gestor.personajes.clear();

      await gestor.agregar(dir1.getPersonaje());
      await gestor.agregar(dir2.getPersonaje());
      await gestor.agregar(dir3.getPersonaje());
      await gestor.agregar(dir4.getPersonaje());

      await gestor.eliminar(dir1.getPersonaje());

      // Obtener el id del personaje eliminado
      final idEliminado = dir1.getPersonaje().id;

      // Comprobar que la lista de personajes no contiene el personaje con el id eliminado
      final personajeExiste =
          gestor.personajes.any((personaje) => personaje.id == idEliminado);

      // Esperar que personajeExiste sea falso
      expect(personajeExiste, isFalse);
      expect(gestor.personajes.length, 3);
    });

    group("Operaciones sobre la lista", () {
      //Test 3: Ordenacion por nombre
      test("Ordenar por nombre", () {
        gestor.ordenarPersonaje(true,
            "nombre"); // Si true, ordena de menor a mayor, alfabéticamente de la A a la Z

        String orden =
            "${gestor.getPersonaje(0).nombre}-${gestor.getPersonaje(1).nombre}-${gestor.getPersonaje(2).nombre}";

        expect(orden, "Alucard-Belmont-Cintia");
      });

      //Test 4: Ordenacion por clase
      test("Ordenar por clase", () {
        gestor.ordenarPersonaje(false,
            "clase"); // Si false, ordena de mayor a menor, alfabéticamente de la Z a la A

        String orden =
            "${gestor.getPersonaje(0).nombre}-${gestor.getPersonaje(1).nombre}-${gestor.getPersonaje(2).nombre}";

        expect(orden, "Belmont-Cintia-Alucard"); // Ranger, Mago, Caballero
      });

      //Test 5: Ordenacion por raza
      test("Ordenar por raza", () {
        gestor.ordenarPersonaje(true, "raza");

        String orden =
            "${gestor.getPersonaje(0).nombre}-${gestor.getPersonaje(1).nombre}-${gestor.getPersonaje(2).nombre}";

        expect(orden, "Cintia-Belmont-Alucard"); // Elfo, Enano, Humano
      });

      //Test 6: Ordenacion por atributo
      test("Ordenar por atributo", () {
        gestor.ordenarPersonaje(false, "atributo", "Punteria");

        String orden =
            "${gestor.getPersonaje(0).nombre}-${gestor.getPersonaje(1).nombre}-${gestor.getPersonaje(2).nombre}";

        expect(orden, "Belmont-Cintia-Alucard"); // 24, 20, 16
      });

      //Test 7: Filtrar por raza
      test("Filtro por raza", () {
        var personajesFiltrados = gestor.filtrarPorRaza("Elfo");

        expect(personajesFiltrados.length, 1);
        expect(personajesFiltrados[0].raza, "Elfo");
      });

      //Test 8: Filtrar por clase
      test("Filtro por clase", () {
        var personajesFiltrados = gestor.filtrarPorClase("Caballero");

        expect(personajesFiltrados.length, 1);
        expect(personajesFiltrados[0].clase, "Caballero");
      });
    });
  });
}
