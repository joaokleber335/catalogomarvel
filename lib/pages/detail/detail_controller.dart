import 'package:catalogo_marvel/repositories/comic/comic_repository.dart';
import 'package:catalogo_marvel/shared/models/comic_data_wrapper.dart';
import 'package:flutter/material.dart';

class DetailController extends ChangeNotifier {
  final ComicRepository repository;

  ValueNotifier<List<Comics>> comics = ValueNotifier([]);

  DetailController({required this.repository});

  Future<void> getComics(int id) async {
    /**
     * OBS: Professor! Deu este problema no momento de buscar os comics,
     * se puder comentar qual o problema agradeço!
     */
    //     Exception has occurred.
    // _TypeError (type 'int' is not a subtype of type 'Iterable<dynamic>')
    final result = await this.repository.get({'characterId': id});
    comics.value = result.data.results;
  }
}
