import 'package:catalogo_marvel/repositories/character/character_repository.dart';
import 'package:catalogo_marvel/shared/models/character.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final CharacterRepository repository;

  ValueNotifier<List<Character>> characters = ValueNotifier([]);
  ValueNotifier<List<Character>> favoriteCharacters = ValueNotifier([]);

  HomeController({required this.repository});

  Future<void> getCharacters() async {
    final result = await this.repository.get(null);
    characters.value = result.data.results;
  }

  Future<void> favorite(Character character) async {
    await this.repository.favorite(character);
  }

  Future<void> getFavoriteCharacters() async {
    favoriteCharacters.value = await this.repository.getFavorites();
  }
}
