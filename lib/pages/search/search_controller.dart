import 'package:catalogo_marvel/repositories/character/character_repository.dart';
import 'package:catalogo_marvel/shared/models/character.dart';
import 'package:flutter/cupertino.dart';

class SearchController extends ChangeNotifier {
  final CharacterRepository repository;

  ValueNotifier<List<Character>> characters = ValueNotifier([]);

  SearchController({required this.repository});

  Future<void> getCharacters(String query) async {
    final result = await this.repository.get({'nameStartsWith': query});
    characters.value = result.data.results;
  }
}
