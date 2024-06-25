class Song {
  final String name;
  final List<String> artists;
  final String previewUrl;

  Song({
    required this.name,
    required this.artists,
    required this.previewUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    var artistsList = (json['artists'] as List<dynamic>).map((e) => e['name'].toString()).toList();
    return Song(
      name: json['name'].toString(),
      artists: artistsList,
      previewUrl: json['preview_url'].toString(),
    );
  }
}
