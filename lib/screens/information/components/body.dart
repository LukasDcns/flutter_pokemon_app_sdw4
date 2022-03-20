import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pokedex/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text('Informations',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: kDefaultPaddin),
        Padding(
          padding: const EdgeInsets.all(kDefaultPaddin),
          child: Column(
            children: <Widget>[
              const Text(
                "Cette application a été développée par l'équipe de développement de Lunie.fr, Belle-Eglise, France.\n\n",
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                "Contact : lukas.descoins@lunie.fr",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: kDefaultPaddin),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(49.1915930, 2.2197160),
                    zoom: 13.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                      attributionBuilder: (_) {
                        return const Text("© OpenStreetMap contributors");
                      },
                    ),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(49.1915930, 2.2197160),
                          builder: (ctx) => const Icon(Icons.location_on,
                              color: Colors.red, size: 50.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
                child: Text(
                  "(Siège social de l\'entreprise)",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
