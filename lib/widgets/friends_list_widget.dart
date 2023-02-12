import 'package:flutter/material.dart';
import 'package:gamers/widgets/painter_friend_box.dart';
import 'package:gamers/widgets/painter_small_circle.dart';
import 'package:provider/provider.dart';
import '../models/games_model.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<Games>(builder: (context, value, child) {
      return FutureBuilder<List<Games>>(
          future: GamesApi.getGamesLocally(context),
          builder: (context, snapshot) {
            final games = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return gamesWidget(games!, context: context);
            }
          });
    });
  }
}

Widget gamesWidget(List<Games> games, {required BuildContext context}) =>
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Friends',
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              const SizedBox(width: 20,),
              Text('Requests',
                style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 30,),),
              const SizedBox(width: 10,),
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                ),
                child: const Center(
                  child: Text('11', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: CustomPaint(
                    painter: FriendBox(),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 100,
                          top: 20,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(game.name, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                                   Text((game.connected) == 'true'
                                       ? 'Connected'
                                       : 'Offline',
                                     style: TextStyle(color: (game.connected) == 'true'
                                         ? Colors.green.withOpacity(0.6)
                                         : Colors.red.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.bold),),
                                   Row(
                                     children: [
                                       Text(game.connected == 'true'
                                           ? 'Playing: '
                                           : '', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.bold),),
                                       Text(game.connected == 'true'
                                           ? game.playing
                                           : '', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                     ],
                                   ),
                                 ],
                                ),
                                const Spacer(),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  width: 70,
                                    height: 70,
                                    child: game.connected == 'true'
                                        ? Image.asset('assets/posters/${game.poster}.jpg')
                                        : null)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 60,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                                color: (game.connected == 'true')
                                    ? Colors.green.withOpacity(0.8)
                                    : Colors.red.withOpacity(0.8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/avatars/${game.avatar}.png'),
                          ),
                        ),
                        SizedBox(
                          width: 72,
                          height: 72,
                          child: CustomPaint(
                            painter: CircleBoxSmall(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
