import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:catalogo_marvel/shared/http_provider/http_provider.dart';
import 'package:catalogo_marvel/shared/models/comic_data_wrapper.dart';

import 'comic_repository.dart';

class ComicRepositoryImpl implements ComicRepository {
  final HttpProvider httpProvider;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String url = '/v1/public/characters';

  ComicRepositoryImpl({required this.httpProvider});

  @override
  Future<ComicDataWrapper> get(Map<String, dynamic>? parametros) async {
    final result = await this
        .httpProvider
        .fetch('${this.url}/${parametros!.values}/comics', parametros);
    return ComicDataWrapper.fromMap(result);
  }
}
