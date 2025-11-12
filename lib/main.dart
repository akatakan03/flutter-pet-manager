import 'package:flutter/material.dart';
import 'package:smart_pet_app/models/Dog.dart';
import 'models/pet.dart';
import 'models/cat.dart';
import 'models/bird.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Pet Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const PetManagerScreen(),
    );
  }
}

class PetManagerScreen extends StatefulWidget {
  const PetManagerScreen({super.key});

  @override
  State<PetManagerScreen> createState() => _PetManagerScreenState();
}

class _PetManagerScreenState extends State<PetManagerScreen> {
  final List<Pet> pets = [
    Dog("Buddy", "Golden Retriever"),
    Cat("Mia"),
    Bird("Tweety"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Pet Manager"),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return PetCard(pet: pet);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total Pets: ${Pet.totalPets}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard({super.key, required this.pet});

  IconData _getIconForPet(Pet pet) {
    if (pet is Dog) {
      return Icons.pets;
    } else if (pet is Cat) {
      return Icons.cruelty_free;
    } else if (pet is Bird) {
      return Icons.flutter_dash;
    }
    return Icons.question_mark;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              _getIconForPet(pet),
              size: 40.0,
              color: Colors.blue[600],
            ),
            const SizedBox(width: 16.0),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${pet.runtimeType}: ${pet.name}",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),

                Text(
                  pet.makeSound(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}