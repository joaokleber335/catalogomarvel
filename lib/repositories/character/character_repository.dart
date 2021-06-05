import 'package:catalogo_marvel/shared/models/character.dart';
import 'package:catalogo_marvel/shared/models/character_data_wrapper.dart';

abstract class CharacterRepository {
  Future<CharacterDataWrapper> get(Map<String, dynamic>? parametros);
  Future<void> favorite(Character character);
  Future<List<Character>> getFavorites();
}
