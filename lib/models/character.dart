import 'package:test_drive/models/info.dart';
import 'package:test_drive/models/results.dart';

class Character {
  Info info;
  List<Results> results;

  Character({ required this.results, required this.info});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      info: Info.fromJson(json['info']),
      results: (json['results'] as List)
          .map((result) => Results.fromJson(result))
          .toList(),
    );
  }
}
