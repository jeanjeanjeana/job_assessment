import 'package:flutter/foundation.dart';
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
}
