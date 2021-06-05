import 'package:catalogo_marvel/shared/models/comic_data_wrapper.dart';

abstract class ComicRepository {
  Future<ComicDataWrapper> get(Map<String, dynamic>? parametros);
}
