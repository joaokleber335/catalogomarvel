import 'package:catalogo_marvel/pages/detail/detail_controller.dart';
import 'package:catalogo_marvel/pages/widgets/generic_bottom_navigation_bar.dart';
import 'package:catalogo_marvel/pages/widgets/my_hero_widget.dart';
import 'package:catalogo_marvel/repositories/comic/comic_repository_impl.dart';
import 'package:catalogo_marvel/shared/http_provider/http_provider_impl.dart';
import 'package:catalogo_marvel/shared/models/character.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Character character;

  const DetailPage({Key? key, required this.character}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailController _controller = DetailController(
    repository: ComicRepositoryImpl(httpProvider: HttpProviderImpl()),
  );
  bool _pinned = true;

  @override
  void initState() {
    print('iniciou essa porra');
    _controller.getComics(widget.character);
    print(_controller.comics.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: _pinned,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.character.name),
                background: MyHeroWidget(
                  tag: widget.character.id,
                  child: Image.network(
                    widget.character.thumbnail.caminhoCompleto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            _createHeroDetail()
          ],
        ),
        bottomNavigationBar: GenericBottomNavigationBar());
  }

  SliverList _createHeroDetail() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _criaContainerConteudo(
            'Descrição',
            child: Text(
              widget.character.description.isNotEmpty
                  ? widget.character.description
                  : 'Nenhuma descrição para este herói!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Divider(),
          _criaContainerConteudo(
            'Commics',
            child: Wrap(
              children: widget.character.comics.items
                  .map((e) => Text(
                        e.name + ' | \n',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ))
                  .toList(),
            ),
          ),
          Divider(),
          _criaContainerConteudo(
            'Commics 2',
            child: Wrap(
              children: _controller.comics.value
                  .map((e) => Text(
                        e.title + ' | \n',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Container _criaContainerConteudo(String titulo,
      {required Widget child, Color? color}) {
    return Container(
      color: color,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              titulo,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          child
        ],
      ),
    );
  }
}
