import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/models/Pokemon.dart';

class ItemCard extends StatelessWidget {
  final Pokemon? pokemon;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    this.pokemon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: pokemon!.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: pokemon!.id,
                child: Image.network(pokemon!.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              pokemon!.type,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            pokemon!.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
