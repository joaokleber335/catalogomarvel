import 'dart:convert';

class Favorito {
  String? id;
  String? heroId;

  Favorito({
    this.id,
    this.heroId,
  });

  Map<String, dynamic> toMap() {
    return {
      'heroId': heroId,
    };
  }

  factory Favorito.fromMap(Map<String, dynamic> map, String id) {
    return Favorito(
      id: id,
      heroId: map['heroId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorito.fromJson(String source, String id) =>
      Favorito.fromMap(json.decode(source), id);
}
