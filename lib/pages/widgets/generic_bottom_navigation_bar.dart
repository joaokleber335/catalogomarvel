import 'package:flutter/material.dart';

class GenericBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    // Modular.to.pushNamed('/private/home');
                  },
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    // Modular.to.pushNamed('/private/favoritos');
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
