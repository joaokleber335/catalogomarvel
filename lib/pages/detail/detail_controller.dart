import 'package:catalogo_marvel/repositories/comic/comic_repository.dart';
import 'package:catalogo_marvel/shared/models/character.dart';
import 'package:catalogo_marvel/shared/models/comic_data_wrapper.dart';
import 'package:flutter/material.dart';

class DetailController extends ChangeNotifier {
  final ComicRepository repository;

  ValueNotifier<List<Comics>> comics = ValueNotifier([]);

  DetailController({required this.repository});

  Future<void> getComics(Character character) async {
    final result = await this.repository.get({'characterId': character.id});
    comics.value = result.data.results;
  }
}
