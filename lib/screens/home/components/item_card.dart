import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';

class ItemCard extends StatelessWidget {
  final VoidCallback press;
  final String title;
  final Color color;
  const ItemCard({
    Key? key,
    required this.press,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
        child: SizedBox(
          child: Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(kDefaultPaddin),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
