import 'package:catalogo_marvel/pages/detail/detail_page.dart';
import 'package:catalogo_marvel/shared/models/character.dart';
import 'package:flutter/material.dart';

class ListHeroes extends StatelessWidget {
  final List<Character> characters;
  final void Function(Character)? onPressed;
  final void Function()? onTap;

  const ListHeroes({
    Key? key,
    required this.characters,
    this.onPressed,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (_, index) {
        final character = characters[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(character: character),
              ),
            );
          },
          leading: Image.network(character.thumbnail.caminhoCompleto),
          title: Text(character.name),
          subtitle: Text(character.description),
          trailing: onPressed != null
              ? IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    this.onPressed!(character);
                  },
                )
              : null,
        );
      },
    );
  }
}
