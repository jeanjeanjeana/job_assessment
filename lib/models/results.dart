import 'package:test_drive/models/location.dart';
import 'package:test_drive/models/origin.dart';
import 'package:intl/intl.dart';

class Results {
  final int id;
  final String name;
  final String image;
  final String? status;
  final String species;
  final String? type;
  final String? gender;
  final Origin? origin;
  final Location? location;
  final List<String>? episode;
  final String? url;
  final String created;

  Results({
    required this.id,
    required this.name,
    required this.image,
    this.status,
    required this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.episode,
    this.url,
    required this.created,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: Origin.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }

  String getFormatedDate() {
    DateTime dateTime = DateTime.parse(created);
    return DateFormat("dd MMMM yyyy").format(dateTime);
  }
}
