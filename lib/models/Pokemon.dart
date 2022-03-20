import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:pokedex/constants.dart';

class Pokemon {
  String id;
  String name;
  String description;
  String type;
  Color color;
  String image;
  String number;
  String size;

  Pokemon({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.color,
    required this.image,
    required this.number,
    required this.size,
  });
}

class AirtableData {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${dotenv.env['AIRTABLE_PROJECT_KEY']}/pokemon",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<Pokemon>> getPokemon() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${dotenv.env['AIRTABLE_API_KEY']}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<Pokemon> values = [];
      String imageUrl = "";

      data.forEach(
        (value) => {
          value['fields']['image']
              .forEach((image) => {imageUrl = image['url']}),
          values.add(
            Pokemon(
              id: value['id'],
              name: value['fields']['name'],
              description: value['fields']['description'] ?? "",
              type: value['fields']['type'],
              color: HexColor(value['fields']['color']),
              image: imageUrl,
              number: value['fields']['number'],
              size: value['fields']['size'],
            ),
          ),
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
