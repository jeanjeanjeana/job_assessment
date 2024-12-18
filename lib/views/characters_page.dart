import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/viewmodels/character_viewmodel.dart';
import 'package:test_drive/views/character_detail_page.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<CharacterViewModel>().fetchAllCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Rick & Morty"),
      ),
      body: SafeArea(
        child: Consumer<CharacterViewModel>(
          builder: (context, viewModel, child) {
            final state = viewModel.state;
            if (state.isLoading && state.data == null) {
              //For the first initialisation
              return Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text('Error: ${state.error}'));
            }

            final characters = state.data ?? [];
            return ListView.builder(
              controller: _scrollController,
              itemCount: characters.length + 1, // +1 for the loading indicator
              itemBuilder: (context, index) {
                if (index == characters.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final character = characters[index];
                return Card(
                  elevation: 4.0,
                  shadowColor: Colors.black.withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    // Add vertical padding
                    child: ListTile(
                      leading: Image.network(character.image),
                      title: Text(character.name),
                      subtitle: Text(character.species),
                      trailing: Icon(Icons.arrow_circle_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                CharacterDetailPage(character: character),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
