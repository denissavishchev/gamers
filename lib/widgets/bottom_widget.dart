import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/games_model.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Games>(builder: (context, value, child) {
      return FutureBuilder<List<Games>>(
          future: GamesApi.getGamesLocally(context),
          builder: (context, snapshot) {
            final promos = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return promoWidget(promos!);
            }
          });
    });
  }
}

Widget promoWidget(List<Games> promos) =>
    SizedBox(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: promos.length,
          itemBuilder: (context, index) {
            final promo = promos[index];
            return Container(
              width: 180,
              padding: const EdgeInsets.symmetric(vertical: 1),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.asset(
                'assets/posters/${promo.poster}.jpg',
                fit: BoxFit.fill,
              ),
            );
          }),
    );
