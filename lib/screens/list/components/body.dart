import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/screens/details/details_screen.dart';
import 'package:pokedex/screens/list/components/item_card.dart';

class Body extends StatelessWidget {
  final AirtableData airtableData = AirtableData();
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text('Pokedex',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: kDefaultPaddin),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: FutureBuilder(
              future: airtableData.getPokemon(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Pokemon>> snapshot) {
                if (snapshot.hasData) {
                  List<Pokemon>? pokemons = snapshot.data;
                  return GridView.builder(
                    itemCount: pokemons?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      pokemon: pokemons![index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            pokemon: pokemons[index],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
