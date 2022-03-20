import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Pokemon pokemon;
  const DetailsScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemon.color,
      appBar: buildAppBar(context),
      body: Body(
        pokemon: pokemon,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: pokemon.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/back.svg', color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
