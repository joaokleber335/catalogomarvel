import 'package:catalogo_marvel/shared/http_provider/http_provider.dart';
import 'package:catalogo_marvel/shared/models/character.dart';
import 'package:catalogo_marvel/shared/models/character_data_wrapper.dart';
import 'package:catalogo_marvel/shared/models/comic_data_wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final HttpProvider httpProvider;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String url = '/v1/public/characters';

  CharacterRepositoryImpl({required this.httpProvider});

  @override
  Future<CharacterDataWrapper> get(Map<String, dynamic>? parametros) async {
    final result = await this.httpProvider.fetch(this.url, parametros);
    return CharacterDataWrapper.fromMap(result);
  }

  @override
  Future<void> favorite(Character character) async {
    try {
      await firestore
          .collection('favorites')
          .doc(character.id.toString())
          .set(character.toMap());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<Character>> getFavorites() async {
    final result = await firestore.collection('favorites').get();
    return result.docs
        .map((querySnapshot) => Character.fromMap(querySnapshot.data()))
        .toList();
  }
}
