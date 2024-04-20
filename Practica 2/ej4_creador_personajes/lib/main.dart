import 'package:ej4_creador_personajes/Clases/clases.dart';
import 'package:ej4_creador_personajes/Clases/clasesbuilder.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';
import 'package:ej4_creador_personajes/Razas/razas.dart';
import 'package:flutter/material.dart';
import 'package:ej4_creador_personajes/fachada.dart';

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
  String selectedRace = '';
  String selectedClass = '';
  String characterName = '';

  void _crearPersonaje() {
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
    f.crearPersonaje(pb,characterName);

    Navigator.push(context, MaterialPageRoute(builder:(context)=>CharacterDetailsScreen()),);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
  @override
  Widget build(BuildContext context) {
    // Obtener el personaje creado utilizando la fachada
    final personaje = Fachada.getInstancia().getProducto();
    final nomRaza = personaje.raza.substring(0, 1).toUpperCase() + personaje.raza.substring(1);
    final nomClase = personaje.clase.substring(0, 1).toUpperCase() + personaje.clase.substring(1);

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 6),
            buildLineaAtributo('Fuerza', personaje.primaryAttr['Fuerza']!.toString()),
            buildLineaAtributo('Destreza', personaje.primaryAttr['Destreza']!.toString()),
            buildLineaAtributo('Resistencia', personaje.primaryAttr['Resistencia']!.toString()),
            buildLineaAtributo('Inteligencia', personaje.primaryAttr['Inteligencia']!.toString()),
            buildLineaAtributo('Sabiduría', personaje.primaryAttr['Sabiduria']!.toString()),
            buildLineaAtributo('Carisma', personaje.primaryAttr['Carisma']!.toString()),
            buildLineaAtributo('Percepción', personaje.primaryAttr['Percepcion']!.toString()),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            const Text(
              'Atributos Secundarios',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 6),
            buildLineaAtributo('Vida', personaje.secondaryAttr['Vida']!.toString()),
            buildLineaAtributo('Estamina', personaje.secondaryAttr['Estamina']!.toString()),
            buildLineaAtributo('Mana', personaje.secondaryAttr['Mana']!.toString()),
            buildLineaAtributo('Persuasión', personaje.secondaryAttr['Persuasion']!.toString()),
            buildLineaAtributo('Agilidad', personaje.secondaryAttr['Agilidad']!.toString()),
            buildLineaAtributo('Intimidación', personaje.secondaryAttr['Intimidacion']!.toString()),
            buildLineaAtributo('Crítico', personaje.secondaryAttr['Critico']!.toString()),
            buildLineaAtributo('Puntería', personaje.secondaryAttr['Punteria']!.toString()),
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