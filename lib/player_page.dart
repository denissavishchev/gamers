import 'package:flutter/material.dart';
import 'package:gamers/main_page.dart';
import 'package:gamers/widgets/friends_list_widget.dart';
import 'package:gamers/widgets/painter_circle.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 860,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: MediaQuery.of(context).size.width / 2.4,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff0074d2),
                            blurRadius: 200,
                            spreadRadius: 35)
                      ]),
                ),
              ),
              Positioned(
                top: 15,
                left: MediaQuery.of(context).size.width / 1.6,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      color: Colors.green.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5)
                      ]),
                ),
              ),
              Positioned(
                top: 190,
                left: 0,
                child: Container(
                  width: 150,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff928acb).withOpacity(0.6),
                            blurRadius: 60,
                            spreadRadius: 20)
                      ]),
                ),
              ),
              Positioned(
                top: 250,
                left: 0,
                child: Container(
                  width: 100,
                  height: 0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffb84d56),
                            blurRadius: 50,
                            spreadRadius: 20)
                      ]),
                ),
              ),
              Positioned(
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const MainPage())),
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CustomPaint(
                        painter: CircleBox(),
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/avatars/avatar.png'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      children: [
                        Text('Name ID',
                          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),),
                        const SizedBox(height: 5,),
                        Text('Devis',
                          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 26, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                  child: FriendsList()),
            ],
          ),
        ),
      ),
    );
  }
}

// onPressed: () => Navigator.of(context).push(MaterialPageRoute(
// builder: (BuildContext context) =>
// const MainPage()))
