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

void main(){

  group("Creador de personajes", () { 
    ClaseBuilder classBuilder = LadronBuilder();
    PersonajeBuilder perBuilder = OrcoBuilder(classBuilder);

    //Test 1: CFG de ClaseBuilder
    group("ClaseBuilder CFG", (){ //Probamos que la funcion CFG de ClaseBuilder funciona correctamente
      HashMap<String, double> sec = classBuilder.loadCFG();

      test("ClaseBuilder CFG: Lectura 1", (){expect(sec['Estamina'], 0.75);});
      test("ClaseBuilder CFG: Lectura 2", (){expect(sec['Persuasion'], 1.5);});
      test("ClaseBuilder CFG: Lectura 3", (){expect(sec['Intimidacion'], 0.5);});
    });
 
    //Test 2: CFG de PersonajeBUilder
    group("PersonajeBuilder CFG", (){  //Probamos que la funcion CFG de ClaseBuilder funciona correctamente
      HashMap<String, double> prim = perBuilder.loadCFG();

      test("PersonajeBuilder CFG: Lectura Fuerza", (){expect(prim['Fuerza'], 15);});
      test("PersonajeBuilder CFG: Lectura Destreza", (){expect(prim['Destreza'], 8);});
      test("PersonajeBuilder CFG: Lectura Resistencia", (){ expect(prim['Resistencia'], 13);});
      test("PersonajeBuilder CFG: Lectura Inteligencia", (){expect(prim['Inteligencia'], 6);});
      test("PersonajeBuilder CFG: Lectura Sabiduria", (){expect(prim['Sabiduria'], 4);});
      test("PersonajeBuilder CFG: Lectura Carisma", (){ expect(prim['Carisma'], 3);});
      test("PersonajeBuilder CFG: Lectura Percepcion", (){expect(prim['Percepcion'], 7);});
    });

    //Test 3: Creacion correcta del personaje, los atributos son los correctos leidos de los archivos
    group("Creacion de personaje", (){
      HashMap<String, double> prim = perBuilder.loadCFG();
      HashMap<String, double> sec = classBuilder.loadCFG();
      perBuilder.crearPersonaje();
      Personaje per = perBuilder.getPersonaje();
      HashMap<String, double> primaryAttr = per.primaryAttr;
      HashMap<String, double> secondaryAttr= per.secondaryAttr;

      test("Atributo P Fuerza", (){expect(primaryAttr['Fuerza'], prim['Fuerza']);});
      test("Atributo P Destreza", (){expect(primaryAttr['Destreza'], prim['Destreza']);});
      test("Atributo P Resistencia", (){ expect(primaryAttr['Resistencia'], prim['Resistencia']);});
      test("Atributo P Inteligencia", (){expect(primaryAttr['Inteligencia'], prim['Inteligencia']);});
      test("Atributo P Sabiduria", (){expect(primaryAttr['Sabiduria'], prim['Sabiduria']);});
      test("Atributo P Carisma", (){ expect(primaryAttr['Carisma'], prim['Carisma']);});
      test("Atributo P Percepcion", (){expect(primaryAttr['Percepcion'], prim['Percepcion']);});

      test("Atributo S Vida", (){expect(secondaryAttr['Vida'], primaryAttr['Resistencia']!+primaryAttr["Fuerza"]!);});
      test("Atributo S Estamina", (){expect(secondaryAttr['Estamina'], (primaryAttr["Destreza"]!+primaryAttr["Resistencia"]!)*sec['Estamina']!);});
      test("Atributo S Mana", (){ expect(secondaryAttr['Mana'], primaryAttr["Inteligencia"]!+primaryAttr["Sabiduria"]!);});
      test("Atributo S Persuasión", (){expect(secondaryAttr['Persuasión'], (primaryAttr["Carisma"]!+primaryAttr["Sabiduria"]!)*sec['Persuasion']!);});
      test("Atributo S Intimidacion", (){expect(secondaryAttr['Intimidacion'], (primaryAttr["Destreza"]!+primaryAttr["Inteligencia"]!)*sec['Intimidacion']!);});
      test("Atributo S Agilidad", (){expect(secondaryAttr['Agilidad'], primaryAttr["Fuerza"]!+primaryAttr["Carisma"]!);});
      test("Atributo S Crítico", (){expect(secondaryAttr['Crítico'], primaryAttr["Percepcion"]!+primaryAttr["Inteligencia"]!);});
      test("Atributo S Puntería", (){ expect(secondaryAttr['Puntería'], primaryAttr["Destreza"]!+primaryAttr["Percepcion"]!);});
    });

    //Test 4: Exportacion Correcta del personaje

    
    //Test 5: Funcionamiento del director
    group("Funcionamiento director", (){
      Director dir = Director(perBuilder);
      String nombre = "TestLadronOrco";
      dir.crearPersonaje(nombre);
/*
      test("Director", (){
        Director dir = Director(perBuilder);
      });
*/
    });

    //Test 6: Funcionamiento de la fachada

    //Si eso, tmb pueden ser tests negativos I.E probar que NO se pueda hacer una cosa.
 

  });

  group("Gestor de personajes", (){
    late GestorPersonajes gestor;
    Director dir1 = Director(HumanoBuilder(CaballeroBuilder()));
    dir1.crearPersonaje("Alucard");
    Director dir2 = Director(EnanoBuilder(RangerBuilder()));
    dir2.crearPersonaje("Belmont");
    Director dir3 = Director(ElfoBuilder(MagoBuilder()));
    dir3.crearPersonaje("Cintia");

    setUp(() {
      gestor = GestorPersonajes.getInstancia();
    });

    //Test 1: Se añaden personajes a la lista
    test("Añadir Personaje", (){
      gestor.addPersonaje(dir1.getPersonaje());
      gestor.addPersonaje(dir2.getPersonaje());
      
      expect(gestor.getPersonaje(0).nombre, "Alucard");
    });

    //Test 2: Se eliminan bien los personajes
    test("Eliminar Personaje", (){
      gestor.addPersonaje(dir1.getPersonaje());
      gestor.addPersonaje(dir2.getPersonaje());
      gestor.remPersonaje(0);

      expect(gestor.getPersonaje(0).nombre, "Belmont");        
    });

    group("Operaciones sobre la lista",(){

      setUp(() {
        gestor.addPersonaje(dir3.getPersonaje()); //Cintia (Elfo Mago) | Punteria = 20.0
        gestor.addPersonaje(dir1.getPersonaje()); //Alucard (Caballero Humano) | Punteria = 16.0
        gestor.addPersonaje(dir2.getPersonaje()); //Belmont (Enano Ranger) | Punteria = 24.0
      });

      //Test 3: Ordenacion por nombre
      test("Ordenar por nombre", (){
        gestor.ordenarPorNombre(true);

        String orden = "${gestor.getPersonaje(0).nombre}-${gestor.getPersonaje(1).nombre}-${gestor.getPersonaje(2).nombre}";

        expect(orden, "Alucard-Belmont-Cintia");
      });

      //Test 4: Ordenacion por atributo
      test("Ordenar por atributo", (){
        gestor.ordenarPorAtributo(true, "Punteria");

        String orden = "${gestor.getPersonaje(0).nombre}-${gestor.getPersonaje(1).nombre}-${gestor.getPersonaje(2).nombre}";

        expect(orden, "Belmont-Cintia-Alucard");
      });

      //Test 5: Filtrar por raza
      group("Filtro por raza", (){
        gestor.filtrarPorRaza("Elfo");

        test("Solo hay una entrada", (){expect(gestor.getLength(), 1);});
        test("Es un elfo", (){expect(gestor.getPersonaje(0).raza, "Elfo");});

      });

      //Test 6: Filtrar por clase
      group("Filtro por clase", (){
        gestor.filtrarPorClase("Caballero");

        test("Solo hay una entrada", (){expect(gestor.getLength(), 1);});
        test("Es un caballero", (){expect(gestor.getPersonaje(0).clase, "Caballero");});

      });
    });

  });

}