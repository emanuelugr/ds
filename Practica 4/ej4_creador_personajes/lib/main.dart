import 'dart:ffi';

import 'package:ej4_creador_personajes/Clases/clases.dart';
import 'package:ej4_creador_personajes/Clases/clasesbuilder.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';
import 'package:ej4_creador_personajes/Razas/razas.dart';
import 'package:ej4_creador_personajes/Razas/Personaje.dart';
import 'package:flutter/material.dart';
import 'package:ej4_creador_personajes/fachada.dart';
import 'package:ej4_creador_personajes/gestorPersonajes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Creación de Personaje'),
        ),
        body: CreadorDePersonajes(),
      ),
    );
  }
}

class CreadorDePersonajes extends StatefulWidget {
  @override
  _CreadorDePersonajesState createState() => _CreadorDePersonajesState();
}

class _CreadorDePersonajesState extends State<CreadorDePersonajes> {
  Fachada f = Fachada.getInstancia();
  GestorPersonajes gestor = GestorPersonajes.getInstancia();
  String selectedRace = '';
  String selectedClass = '';
  String characterName = '';

  // Variables para ordenar y filtrar
  String orderBy = 'Nombre'; // Por defecto ordenar por nombre
  String filterByRace = '';
  String filterByClass = '';

  String currentUser = "Alejandro";
  List<String> users = ["Alejandro", "Timur", "Emanuel", "Thomas"];
  late List<TextEditingController> _controllerslist;
  List<Personaje> filteredList = [];

  @override
  void initState() {
    super.initState();
    _cargarPersonajes();
  }

  void _cargarPersonajes() async {
    try {
      await gestor.cargarPersonajes(currentUser);
      _controllerslist = List.generate(
          gestor.personajes.length + 1, (index) => TextEditingController());
      setState(() {});
    } catch (e) {
      print("Error loading personajes: $e");
    }
  }

  void _crearPersonaje() async {
    //Clase
    ClaseBuilder cb;
    switch (selectedClass) {
      case 'Caballero':
        cb = CaballeroBuilder();
        break;
      case 'Ladron':
        cb = LadronBuilder();
        break;
      case 'Mago':
        cb = MagoBuilder();
        break;
      case 'Ranger':
        cb = RangerBuilder();
        break;
      default:
        cb = CaballeroBuilder();
    }

    //Raza
    PersonajeBuilder pb;
    switch (selectedRace) {
      case 'Elfo':
        pb = ElfoBuilder(cb);
        break;
      case 'Enano':
        pb = EnanoBuilder(cb);
        break;
      case 'Humano':
        pb = HumanoBuilder(cb);
        break;
      case 'Orco':
        pb = OrcoBuilder(cb);
        break;
      default:
        pb = HumanoBuilder(cb);
    }

    await gestor.agregar(f.crearPersonaje(pb, characterName, currentUser));

    //var dummy = gestor.getPersonaje(gestor.getLength() - 1);
    //dummy.ExportState("STATE_TEST.TXT");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CharacterDetailsScreen(
              gestor.getPersonaje(gestor.getLength() - 1))),
    );

    _controllerslist.add(TextEditingController());
    setState(() {
      _cargarPersonajes();
    });
  }

  void eliminarPersonaje(personaje) async {
    await gestor.eliminar(personaje);
    setState(() {
      _cargarPersonajes();
    });
  }

  void modificarNombre(personaje, index) async {
    String nombre = _controllerslist[index].text;
    if (nombre != "") {
      _controllerslist[index].text = "";
      await gestor.cambiarNombre(personaje, nombre);
    }
    setState(() {
      _cargarPersonajes();
    });
  }

  Widget _buildListaPersonajes() {
    // Aplicar filtro
    filteredList = gestor.personajes;
    //gestor.getLista(currentUser) as List<Personaje>;
    if (filterByRace.isNotEmpty) {
      filteredList = filteredList.where((p) => p.raza == filterByRace).toList();
    }
    if (filterByClass.isNotEmpty) {
      filteredList =
          filteredList.where((p) => p.clase == filterByClass).toList();
    }

    // Aplicar orden
    if (orderBy == 'Nombre') {
      filteredList.sort((a, b) => a.nombre.compareTo(b.nombre));
    } else if (orderBy == 'Raza') {
      filteredList.sort((a, b) => a.raza.compareTo(b.raza));
    } else if (orderBy == 'Clase') {
      filteredList.sort((a, b) => a.clase.compareTo(b.clase));
    }

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final personaje = filteredList[index];
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                  width: 500,
                  child: ListTile(
                    title: Text(
                        'Index: $index, ID: ${personaje.id} ${personaje.nombre} - ${personaje.raza} - ${personaje.clase}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CharacterDetailsScreen(personaje)),
                      );
                    },
                  )),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 177, 177, 177),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    //initialValue: get(index),
                    controller: _controllerslist[index],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              FilledButton.tonal(
                onPressed: () => modificarNombre(personaje, index),
                child: const Text(
                  "CAMBIAR NOMBRE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 30),
              FilledButton.tonal(
                onPressed: () => eliminarPersonaje(personaje),
                child: const Text(
                  "ELIMINAR PERSONAJE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    gestor.cargarPersonajes(currentUser);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: currentUser,
            onChanged: (String? newValue) {
              setState(() {
                currentUser = newValue!;
              }); //fin set State
              _cargarPersonajes();
            },
            items: users.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const Text(
            'Raza:',
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              RaceButton(
                text: 'Elfo',
                isSelected: selectedRace == 'Elfo',
                onTap: () {
                  setState(() {
                    selectedRace = 'Elfo';
                  });
                },
              ),
              RaceButton(
                text: 'Enano',
                isSelected: selectedRace == 'Enano',
                onTap: () {
                  setState(() {
                    selectedRace = 'Enano';
                  });
                },
              ),
              RaceButton(
                text: 'Humano',
                isSelected: selectedRace == 'Humano',
                onTap: () {
                  setState(() {
                    selectedRace = 'Humano';
                  });
                },
              ),
              RaceButton(
                text: 'Orco',
                isSelected: selectedRace == 'Orco',
                onTap: () {
                  setState(() {
                    selectedRace = 'Orco';
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Clase:',
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              ClassButton(
                text: 'Caballero',
                isSelected: selectedClass == 'Caballero',
                onTap: () {
                  setState(() {
                    selectedClass = 'Caballero';
                  });
                },
              ),
              ClassButton(
                text: 'Ladrón',
                isSelected: selectedClass == 'Ladron',
                onTap: () {
                  setState(() {
                    selectedClass = 'Ladron';
                  });
                },
              ),
              ClassButton(
                text: 'Mago',
                isSelected: selectedClass == 'Mago',
                onTap: () {
                  setState(() {
                    selectedClass = 'Mago';
                  });
                },
              ),
              ClassButton(
                text: 'Ranger',
                isSelected: selectedClass == 'Ranger',
                onTap: () {
                  setState(() {
                    selectedClass = 'Ranger';
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nombre del Personaje',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                characterName = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _crearPersonaje();
            },
            child: const Text('Crear Personaje'),
          ),
          const SizedBox(height: 36.0),
          Row(
            children: [
              Row(
                children: [
                  DropdownButton<String>(
                    value: orderBy,
                    onChanged: (newValue) {
                      setState(() {
                        orderBy = newValue!;
                      });
                    },
                    items: ['Nombre', 'Raza', 'Clase'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(width: 25.0),
                  DropdownButton<String>(
                    value: filterByRace,
                    onChanged: (newValue) {
                      setState(() {
                        filterByRace = newValue!;
                      });
                    },
                    items: ['', 'Elfo', 'Enano', 'Humano', 'Orco']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.isEmpty ? 'Sin Filtro' : value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(width: 25.0),
                  DropdownButton<String>(
                    value: filterByClass,
                    onChanged: (newValue) {
                      setState(() {
                        filterByClass = newValue!;
                      });
                    },
                    items: ['', 'Caballero', 'Ladron', 'Mago', 'Ranger']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.isEmpty ? 'Sin Filtro' : value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 36.0),
          const Text(
            'Lista de Personajes:',
            style: TextStyle(fontSize: 20.0),
          ),
          // Aquí se muestra la lista de personajes
          Expanded(
            child: _buildListaPersonajes(),
          ),
        ],
      ),
    );
  }
}

class RaceButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const RaceButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}

class ClassButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ClassButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}

class CharacterDetailsScreen extends StatelessWidget {
  final Personaje personaje;
  CharacterDetailsScreen(this.personaje, {super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el personaje creado utilizando la fachada
    final nomRaza = personaje.raza;
    final nomClase = personaje.clase;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Personaje'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              personaje.nombre,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            buildLineaAtributo('Raza', nomRaza),
            buildLineaAtributo('Clase', nomClase),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            const Text(
              'Atributos Primarios',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            buildLineaAtributo(
                'Fuerza', personaje.primaryAttr['Fuerza']!.toString()),
            buildLineaAtributo(
                'Destreza', personaje.primaryAttr['Destreza']!.toString()),
            buildLineaAtributo('Resistencia',
                personaje.primaryAttr['Resistencia']!.toString()),
            buildLineaAtributo('Inteligencia',
                personaje.primaryAttr['Inteligencia']!.toString()),
            buildLineaAtributo(
                'Sabiduría', personaje.primaryAttr['Sabiduria']!.toString()),
            buildLineaAtributo(
                'Carisma', personaje.primaryAttr['Carisma']!.toString()),
            buildLineaAtributo(
                'Percepción', personaje.primaryAttr['Percepcion']!.toString()),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            const Text(
              'Atributos Secundarios',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            buildLineaAtributo(
                'Vida', personaje.secondaryAttr['Vida']!.toString()),
            buildLineaAtributo(
                'Estamina', personaje.secondaryAttr['Estamina']!.toString()),
            buildLineaAtributo(
                'Mana', personaje.secondaryAttr['Mana']!.toString()),
            buildLineaAtributo('Persuasión',
                personaje.secondaryAttr['Persuasion']!.toString()),
            buildLineaAtributo(
                'Agilidad', personaje.secondaryAttr['Agilidad']!.toString()),
            buildLineaAtributo('Intimidación',
                personaje.secondaryAttr['Intimidacion']!.toString()),
            buildLineaAtributo(
                'Crítico', personaje.secondaryAttr['Critico']!.toString()),
            buildLineaAtributo(
                'Puntería', personaje.secondaryAttr['Punteria']!.toString()),
          ],
        ),
      ),
    );
  }

  Widget buildLineaAtributo(String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}
