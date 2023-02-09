import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/games_model.dart';

class PromoWidget extends StatelessWidget {
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
      width: double.infinity,
      height: 95,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 320,
              height: 35,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 2,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 320,
                      height: 35,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 3,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.transparent
                                ],
                                stops: [
                                  0.3, 1
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 320,
                      height: 35,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffa8efff).withOpacity(0.1),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.elliptical(1000, 50),
                                  topRight: Radius.elliptical(1000, 50),
                                  bottomLeft: Radius.elliptical(1000, 50),
                                  bottomRight: Radius.elliptical(1000, 50),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffa8efff),
                                  spreadRadius: 1,
                                  blurRadius: 10
                                )
                              ]
                            ),
                          ),
                          RotationTransition(
                            turns: const AlwaysStoppedAnimation(120/360),
                            child: Container(
                              height: 5,
                              width: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xffa8efff).withOpacity(0.1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.elliptical(1000, 50),
                                    topRight: Radius.elliptical(1000, 50),
                                    bottomLeft: Radius.elliptical(1000, 50),
                                    bottomRight: Radius.elliptical(1000, 50),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 1,
                                    blurRadius: 10
                                  )
                                ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 350,
              height: 65,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: promos.length,
                  itemBuilder: (context, index) {
                    final promo = promos[index];
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: Colors.white.withOpacity(0.6)),
                          width: 77,
                          height: 77,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: 75,
                          // height: 70,
                          child: Image.asset(
                            'assets/posters/${promo.poster}.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
