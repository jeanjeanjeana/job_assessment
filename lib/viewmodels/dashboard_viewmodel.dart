import 'package:flutter/foundation.dart';
import '../models/gender.dart';
import '../services/api_service.dart';
import '../models/result_state.dart';
import '../models/results.dart';

class DashboardViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  ResultState<List<Results>> _state = ResultState.loading();

  ResultState<List<Results>> get state => _state;

  int _currentPage = 1;
  bool _hasMore = true;
  bool _isFetching = false;

  Future<void> fetchAllCharactersBySpecies() async {
    if (_isFetching) return;
    _isFetching = true;

    if (!_hasMore) return;
    notifyListeners();

    List<Results> fetchedCharacters = [];

    while (_hasMore) {
      try {
        final result =
            await _apiService.fetchAllCharactersBySpecies(page: _currentPage);
        final newCharacters = result.results;
        fetchedCharacters.addAll(newCharacters);
        _hasMore = result.info.next != null;
        _currentPage++;
      } catch (e) {
        _state = ResultState.error(e.toString());
        notifyListeners();
        return;
      }
    }

    _state = ResultState.success(fetchedCharacters);
    _isFetching = false;
    notifyListeners();
  }

  Future<void> fetchAllCharactersNoPagination() async {
    if (_isFetching) return;
    _isFetching = true;

    if (!_hasMore) return;
    notifyListeners();

    List<Results> fetchedCharacters = [];

    while (_hasMore) {
      try {
        final result =
        await _apiService.fetchAllCharacters(page: _currentPage);
        final newCharacters = result.results;
        fetchedCharacters.addAll(newCharacters);
        _hasMore = result.info.next != null;
        _currentPage++;
      } catch (e) {
        _state = ResultState.error(e.toString());
        notifyListeners();
        return;
      }
    }

    _state = ResultState.success(fetchedCharacters);
    _isFetching = false;
    notifyListeners();
  }

  int getNumberOfHuman() {
    if(state.hasData) {
      return state.data?.where((character) => character.species == "Human").length ?? 0;
    } else {
      return 0;
    }
  }

  int getNumberOfAliveCharacter() {
    if(state.hasData) {
      return state.data?.where((character) => character.status == "Alive").length ?? 0;
    } else {
      return 0;
    }
  }

  int getNumberOfDeadCharacter() {
    if(state.hasData) {
      return state.data?.where((character) => character.status == "Dead").length ?? 0;
    } else {
      return 0;
    }
  }

  int getNumberOfUnknownCharacter() {
    if(state.hasData) {
      return state.data?.where((character) => character.status == "unknown").length ?? 0;
    } else {
      return 0;
    }
  }

  int getNumberOfGenderCharacter(Gender gender) {
    if(state.hasData) {
      return state.data?.where((character) => character.gender == gender.name).length ?? 0;
    } else {
      return 0;
    }
  }

  List<String> getAllSpecies() {
    List<String> spicesType = [];
    if(state.hasData) {
      state.data?.forEach((value) {
        if(!spicesType.contains(value.species)){
          spicesType.add(value.species);
        }
      });
      return spicesType;
    } else {
      return [];
    }
  }
}
