import 'package:catalogo_marvel/pages/home/home_controller.dart';
import 'package:catalogo_marvel/pages/search/search_page.dart';
import 'package:catalogo_marvel/pages/widgets/list_heroes.dart';
import 'package:catalogo_marvel/repositories/character/character_repository_impl.dart';
import 'package:catalogo_marvel/shared/http_provider/http_provider_impl.dart';
import 'package:catalogo_marvel/shared/models/character.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController(
    repository: CharacterRepositoryImpl(httpProvider: HttpProviderImpl()),
  );

  @override
  void initState() {
    controller.getCharacters();
    controller.getFavoriteCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
          title: Text('Catálogo Marvel'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _goToSearchPage,
            )
          ],
        ),
        body: TabBarView(
          children: [
            _createHomeBody(),
            _createFavoriteBody(),
          ],
        ),
      ),
    );
  }

  Widget _createHomeBody() {
    return ValueListenableBuilder(
      valueListenable: controller.characters,
      builder: (_, __, ___) {
        return ListHeroes(
          characters: controller.characters.value,
          onPressed: (Character character) {
            controller.favorite(character);
          },
        );
      },
    );
  }

  Widget _createFavoriteBody() {
    return ValueListenableBuilder(
      valueListenable: controller.favoriteCharacters,
      builder: (_, __, ___) {
        return ListHeroes(characters: controller.favoriteCharacters.value);
      },
    );
  }

  void _goToSearchPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchPage(),
      ),
    );
  }
}
