import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';

class ColorDot extends StatelessWidget {
  final Color color;
  final String type;
  const ColorDot({
    Key? key,
    required this.color,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: DecoratedBox(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPaddin / 2),
          child: Text(type,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
