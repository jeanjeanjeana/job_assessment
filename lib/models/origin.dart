class Origin {
  final String? name;
  final String? url;

  Origin({
    this.name,
    this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }
}
