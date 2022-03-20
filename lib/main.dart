import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex/screens/home/home_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const HomeScreen());
  }
}
