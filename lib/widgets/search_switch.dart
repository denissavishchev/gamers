import 'package:flutter/material.dart';

class SearchSwitch extends StatefulWidget {
  const SearchSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchSwitch> createState() => _SearchSwitchState();
}

class _SearchSwitchState extends State<SearchSwitch> {

  bool isSwitched = true;

  void isPressed() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: GestureDetector(
          onTap: isPressed,
          child: Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Icon(Icons.search, color: Colors.white.withOpacity(0.5),),
          ),
        ),
        secondChild: Container(
          width: 200,
          height: 40,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: TextField(
            // autofocus: true,
            style: const TextStyle(color: Colors.white, fontSize: 32),
            cursorColor: Colors.white,
              textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.4), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.4), width: 2),
              ),
            ),
            onSubmitted: (val){
              isPressed();
            }
          ),
        ),
        crossFadeState: isSwitched ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200));
  }
}