import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/light_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopPart extends StatefulWidget {
  Function backFn;
  Color bulbColor; 
  TopPart(this.backFn,this.bulbColor);
  @override
  _TopPartState createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> with SingleTickerProviderStateMixin {
  late final AnimationController slideController =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  late final Animation<Offset> slideAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slideAnimation =
        Tween<Offset>(begin: const Offset(5.0, 0), end: Offset.zero).animate(
            CurvedAnimation(parent: slideController, curve: Curves.easeOut));
    slideController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // color: Colors.black45,
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.backFn();
                            },
                            child: SvgPicture.asset(
                                'assets/Icon ionic-md-arrow-round-back.svg',),
                                
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: AutoSizeText(
                              'Bed Room',
                              maxLines: 2,
                              minFontSize: 30.0,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '4 Lights',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Stack(children: [
                  SvgPicture.asset(
                    'assets/light bulb.svg',
                    color: widget.bulbColor,
                  ),
                  SvgPicture.asset('assets/Group 38.svg')
                ]),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            height: 50,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                SlideTransition(
                    position: slideAnimation,
                    child:
                        LightItem(false, 'assets/surface1.svg', 'Main Light')),
                const SizedBox(width: 20),
                SlideTransition(
                  position: slideAnimation,
                  child: LightItem(
                      true, 'assets/furniture-and-household.svg', 'Desk Light'),
                ),
                const SizedBox(width: 20),
                SlideTransition(
                    position: slideAnimation,
                    child: LightItem(false, 'assets/bed (1).svg', 'Bed Light')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
