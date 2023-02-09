import 'package:flutter/material.dart';
import 'package:gamers/widgets/painter_circle.dart';
import 'package:gamers/widgets/painter_main_box.dart';
import 'package:provider/provider.dart';

import '../models/images_model.dart';

class CenterView extends StatelessWidget {
  const CenterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Images>(builder: (context, value, child) {
      return FutureBuilder<List<Images>>(
          future: ImagesApi.getImagesLocally(context),
          builder: (context, snapshot) {
            final images = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return imagesWidget(images!, context: context);
            }
          });
    });
  }
}

Widget imagesWidget(List<Images> images, {required BuildContext context}) =>
    SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CustomPaint(
              painter: MainBox(
                color: Color(int.parse(image.color)).withOpacity(0.8),
                color2: Color(int.parse(image.color2)).withOpacity(0.6),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 150,
                    bottom: 30,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(20 / 360),
                      child: Container(
                        width: 10,
                        height: 150,
                        decoration: const BoxDecoration(
                          // color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffa75c7f),
                                spreadRadius: 50,
                                blurRadius: 200)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 70,
                    top: 100,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(20 / 360),
                      child: Container(
                        width: 5,
                        height: 20,
                        decoration: const BoxDecoration(
                          // color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffa75c7f),
                                spreadRadius: 40,
                                blurRadius: 100)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Image.asset(
                        'assets/images/${image.image}.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Image.asset(
                        'assets/images/${image.name2}.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    child: Container(
                      padding: const EdgeInsets.only(right: 30),
                      margin: const EdgeInsets.only(left: 20, right: 30),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: const Color(0xffcb66aa).withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 0)
                      ]),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text(
                        image.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    child: Container(
                      padding: const EdgeInsets.only(right: 30),
                      margin: const EdgeInsets.only(left: 20, right: 30),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: const Color(0xffcb66aa).withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 0)
                      ]),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: SingleChildScrollView(
                          child: Text(
                        image.description,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  ),
                  Positioned(
                    left: -8,
                    top: 4,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 140,
                          height: 140,
                          // color: Colors.white,
                          child: Center(
                            child: SizedBox(
                              width: 120,
                              height: 120,
                              child: CustomPaint(
                                painter: CircleBox(),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                            top: 0,
                            right: 40,
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 24,
                            )),
                        Positioned(
                            top: 16,
                            right: 20,
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow.withOpacity(0.9),
                              size: 18,
                            )),
                        Positioned(
                            top: 38,
                            right: 10,
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow.withOpacity(0.8),
                              size: 12,
                            )),
                        Positioned.fill(
                          child: Center(
                            child: Text(
                              image.rating,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 46,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: Column(
                              children: [
                                Text(
                                  'Reviews ${image.rating}K',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(
                                      int.parse(image.stars),
                                      (index) => const SizedBox(
                                          width: 20,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ))),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 130,
                                height: 40,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xfff74a52),
                                    Color(0xff7d5fa5)
                                  ]),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Get it now!',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Color(0xffe94a5f),
                                          Color(0xffcb66aa)
                                        ]),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xffb0518a)
                                              .withOpacity(0.8),
                                          spreadRadius: 4,
                                          blurRadius: 14,
                                          offset: const Offset(-12, -12)),
                                      BoxShadow(
                                          color: const Color(0xffb0518a)
                                              .withOpacity(0.6),
                                          spreadRadius: 4,
                                          blurRadius: 14,
                                          offset: const Offset(8, 8)),
                                    ]),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
