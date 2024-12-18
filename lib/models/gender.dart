enum Gender {
  female('Female'),
  male('Male'),
  genderless('Genderless'),
  unknown('unknown');

  final String name;

  const Gender(this.name);

  String get displayName => name;
}