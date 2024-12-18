import 'package:flutter/material.dart';
import 'package:test_drive/models/gender.dart';
import 'package:test_drive/viewmodels/character_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/viewmodels/dashboard_viewmodel.dart';

class DashboardDataPage extends StatefulWidget {
  const DashboardDataPage({super.key});

  @override
  State<DashboardDataPage> createState() => _DashboardDataPageState();
}

class _DashboardDataPageState extends State<DashboardDataPage> {
  bool _useLoadedData = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Rick & Morty"),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SwitchListTile(
                    title: Text(_useLoadedData
                        ? "Use Loaded Data"
                        : "Use All The Data"),
                    value: _useLoadedData,
                    onChanged: (value) {
                      setState(() {
                        _useLoadedData = value;
                        if (!_useLoadedData) {
                          context
                              .read<DashboardViewModel>()
                              .fetchAllCharactersNoPagination();
                        }
                      });
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _useLoadedData
                        ? Consumer<CharacterViewModel>(
                            builder: (context, viewModel, child) {
                              final speciesList = viewModel.getAllSpecies();

                              if (viewModel.state.isLoading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              return Stack(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0, left: 10.0),
                                          child: Text(
                                            '- Number of loaded characters: ${viewModel.state.data!.length}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Human: ${viewModel.getNumberOfHuman()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Alive Character: ${viewModel.getNumberOfAliveCharacter()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Dead Character: ${viewModel.getNumberOfDeadCharacter()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Unknown Character: ${viewModel.getNumberOfUnknownCharacter()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Male Character: ${viewModel.getNumberOfGenderCharacter(Gender.male)}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Female Character: ${viewModel.getNumberOfGenderCharacter(Gender.female)}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Genderless Character: ${viewModel.getNumberOfGenderCharacter(Gender.genderless)}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Unknown Gender Character: ${viewModel.getNumberOfGenderCharacter(Gender.unknown)}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of spices: ${viewModel.getAllSpecies().length}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 10.0),
                                          child: Text(
                                            'Type of spices: ',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: speciesList.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: Text(
                                                    speciesList[index],
                                                    style:
                                                        TextStyle(fontSize: 24),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ]),
                                ],
                              );
                            },
                          )
                        : Consumer<DashboardViewModel>(
                            builder: (context, viewModel, child) {
                              final speciesList = viewModel.getAllSpecies();

                              if (viewModel.state.isLoading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return Stack(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0, left: 10.0),
                                          child: Text(
                                            '- Number of loaded characters: ${viewModel.state.data!.length}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Human: ${viewModel.getNumberOfHuman()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Alive Character: ${viewModel.getNumberOfAliveCharacter()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Dead Character: ${viewModel.getNumberOfDeadCharacter()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Unknown Character: ${viewModel.getNumberOfUnknownCharacter()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Male Character: ${viewModel.getNumberOfGenderCharacter(Gender.male)}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Female Character: ${viewModel.getNumberOfGenderCharacter(Gender.female)}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Genderless Character: ${viewModel.getNumberOfGenderCharacter(Gender.genderless)}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of Unknown Gender Character: ${viewModel.getNumberOfGenderCharacter(Gender.unknown)}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '- Number of spices: ${viewModel.getAllSpecies().length}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 10.0),
                                          child: Text(
                                            'Type of spices: ',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                              NeverScrollableScrollPhysics(),
                                              itemCount: speciesList.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                    speciesList[index],
                                                    style:
                                                    TextStyle(fontSize: 24),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ]),
                                ],
                              );
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
