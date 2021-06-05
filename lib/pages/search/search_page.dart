import 'dart:async';

import 'package:catalogo_marvel/pages/search/search_controller.dart';
import 'package:catalogo_marvel/pages/widgets/list_heroes.dart';
import 'package:catalogo_marvel/repositories/character/character_repository_impl.dart';
import 'package:catalogo_marvel/shared/http_provider/http_provider_impl.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _textEditingController = TextEditingController();
  SearchController _controller = SearchController(
      repository: CharacterRepositoryImpl(httpProvider: HttpProviderImpl()));

  Timer? _timer;

  @override
  void initState() {
    _textEditingController.addListener(() {
      if (_timer?.isActive ?? false) _timer!.cancel();
      _timer = Timer(Duration(seconds: 3), () {
        _controller.getCharacters(_textEditingController.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search hero',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: _createResultSearchBody(),
            )
          ],
        ),
      ),
    );
  }

  Widget _createResultSearchBody() {
    return ValueListenableBuilder(
      valueListenable: _controller.characters,
      builder: (_, __, ___) {
        if (_controller.characters.value.length == 0) {
          return Center(child: Text('Nenhum registro encontrado...'));
        }
        return ListHeroes(characters: _controller.characters.value);
      },
    );
  }
}
