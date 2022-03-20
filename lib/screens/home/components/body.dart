import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/screens/home/components/item_card.dart';
import 'package:pokedex/screens/information/information_screen.dart';
import 'package:pokedex/screens/list/list_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text('Pokémons',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: kDefaultPaddin),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddin,
          ),
          child: Text(
            "Cette application regroupe tous les Pokémons, vous pouvez les voirs dans la partie \"Pokédex\".\n\n",
            style: TextStyle(
                height: 1.5, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Column(
              children: <Widget>[
                ItemCard(
                  title: "Pokédex",
                  color: const Color(0xFF5CBC61),
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListScreen(),
                    ),
                  ),
                ),
                ItemCard(
                  title: "Informations",
                  color: const Color(0xFFF37567),
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InformationScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPaddin),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Text(
                    'Dernieres actualités',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: kDefaultPaddin / 2),
                          child: Image.asset("assets/images/logo_$i.jpeg"),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
