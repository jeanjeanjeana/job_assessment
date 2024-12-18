import 'package:flutter/material.dart';
import 'package:test_drive/models/results.dart';

class CharacterDetailPage extends StatelessWidget {
  final Results character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              top: 16.0, right: 16.0, left: 16.0),
                          child: Text("Species: ${character.species}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Status: ${character.status}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Gender: ${character.gender}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Location: ${character.location?.name}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Origin: ${character.origin?.name}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Created: ${character.getFormatedDate()}"),
                        ),
                        // Add any other data or widgets here
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                  child: ClipOval(
                    child: Image.network(
                      character.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
