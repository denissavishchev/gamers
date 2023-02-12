import 'package:flutter/material.dart';
import 'package:gamers/widgets/avatar_widget.dart';
import 'package:gamers/widgets/bottom_nav_bar.dart';
import 'package:gamers/widgets/bottom_widget.dart';
import 'package:gamers/widgets/center_view.dart';
import 'package:gamers/widgets/promo_widget.dart';
import 'package:gamers/widgets/search_switch.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 860,
          child: Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff0074d2),
                      blurRadius: 200,
                      spreadRadius: 40
                    )
                  ]
                ),
              ),
              Positioned(
                top: 350,
                left: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff0074d2),
                            blurRadius: 200,
                            spreadRadius: 40
                        )
                      ]
                  ),
                ),
              ),
              Positioned(
                top: 360,
                left: 70,
                child: Container(
                  width: 0,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff936194),
                            blurRadius: 50,
                            spreadRadius: 40
                        )
                      ]
                  ),
                ),
              ),
              Positioned(
                top: 330,
                left: 110,
                child: Container(
                  width: 20,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff928acb),
                            blurRadius: 30,
                            spreadRadius: 20
                        )
                      ]
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 50, 18, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 70,
                            height: 60,
                            child: AvatarWidget(),
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset('assets/icons/console.png'),
                          ),
                          const SearchSwitch()
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: PromoWidget(),
                    ),
                    const SizedBox(height: 10,),
                    const CenterView(),
                    const SizedBox(height: 20,),
                    const BottomWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}








