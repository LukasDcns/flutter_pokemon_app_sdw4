import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/models/Pokemon.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPaddin,
      ),
      child: Text(
        pokemon!.description,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
