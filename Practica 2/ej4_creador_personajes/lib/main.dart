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
  Fachada f = Fachada();
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
                isSelected: selectedClass == 'Ladrón',
                onTap: () {
                  setState(() {
                    selectedClass = 'Ladrón';
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
    // Obtener los datos del personaje utilizando Fachada.getProducto()
    // Ejemplo:
    // final personaje = Fachada.getProducto();
    // Luego, utiliza los datos del personaje para construir la interfaz de usuario de esta pantalla.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Personaje'),
      ),
      body: Center(
        child: const Text('Aquí se mostrarán los detalles del personaje'),
      ),
    );
  }
}