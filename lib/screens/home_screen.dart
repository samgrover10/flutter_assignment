import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/rooms_grid.dart';
import 'package:flutter_assignment/widgets/top_part.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  bool roomSelected = false;
  double brightness = 1.0;
  Color bulbColor = Colors.black;

  late final AnimationController _slideAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));
  late final AnimationController _fadeAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));
  late final Animation<Offset> _slideAnimation =
      Tween<Offset>(begin: const Offset(-2.5, 0), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _slideAnimationController, curve: Curves.easeOut));
  late final Animation<double> _fadeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _slideAnimationController, curve: Curves.linear));
  late final Animation<double> _fadeAnimation2 =
      Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
          parent: _fadeAnimationController, curve: Curves.linear));
  final List<Color> _colors = [
    const Color(0xffFF9B9B),
    const Color(0xff94EB9E),
    const Color(0Xff94CAEB),
    const Color(0xffA594EB),
    const Color(0xffDE94EB),
    const Color(0xffEBD094)
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fadeAnimationController.dispose();
    _slideAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0A4DA2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              height: roomSelected
                  ? MediaQuery.of(context).size.height * 0.3
                  : MediaQuery.of(context).size.height * 0.2,
              duration: const Duration(milliseconds: 500),
              child: !roomSelected
                  ? Container(
                      margin: const EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const AutoSizeText(
                              "Control Panel",
                              minFontSize: 30.0,
                              maxLines: 2,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    // backgroundColor: Colors.white,
                                    radius: 35,
                                    child: SvgPicture.asset(
                                      'assets/user.svg',
                                      alignment: Alignment.center,
                                    ),
                                  ))),
                        ],
                      ),
                    )
                  : TopPart(
                      backButtonPressed, bulbColor.withOpacity(brightness)),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Stack(children: [
                AnimatedContainer(
                  width: MediaQuery.of(context).size.width,
                  height: roomSelected
                      ? MediaQuery.of(context).size.height * 0.6
                      : MediaQuery.of(context).size.height * 0.8,
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                      color: Color(0xffF6F8FB),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  duration: const Duration(milliseconds: 500),
                  child: !roomSelected
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              "All Rooms",
                              minFontSize: 18.0,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Color(0xff002D67),
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                                child: FadeTransition(
                                    opacity: _fadeAnimation2,
                                    child: RoomsGrid(changeUI))),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Intensity',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(0xff002D67),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/solution1.svg',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FadeTransition(
                                    opacity: _fadeAnimation,
                                    child: CupertinoSlider(
                                        // inactiveColor: const Color(0xffCFD0D0),
                                        activeColor: const Color(0xffFFD239),
                                        min: 0,
                                        max: 1.0,
                                        value: brightness,
                                        onChanged: (brightnessFrac){
                                            setState(() {
                                            brightness = brightnessFrac;
                                          });
                                        },
                                  ),
                                ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  'assets/solution.svg',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Colors',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(0xff002D67),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bulbColor = _colors[0];
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: _colors[0],
                                      radius: 15,
                                    ),
                                  ),
                                ),
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bulbColor = _colors[1];
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: _colors[1],
                                      radius: 15,
                                    ),
                                  ),
                                ),
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bulbColor = _colors[2];
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: _colors[2],
                                      radius: 15,
                                    ),
                                  ),
                                ),
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bulbColor = _colors[3];
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: _colors[3],
                                      radius: 15,
                                    ),
                                  ),
                                ),
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bulbColor = _colors[4];
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: _colors[4],
                                      radius: 15,
                                    ),
                                  ),
                                ),
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bulbColor = _colors[5];
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: _colors[5],
                                      radius: 15,
                                    ),
                                  ),
                                ),
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/+.svg',
                                        fit: BoxFit.cover,
                                      ),
                                      onPressed: () {},
                                    ),
                                    radius: 15,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Scenes',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(0xff002D67),
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: FadeTransition(
                                opacity: _fadeAnimation,
                                child: GridView(
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1.7,
                                          crossAxisSpacing:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                          mainAxisSpacing:
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05),
                                  children: [
                                    SceneItem(
                                        'assets/surface2.svg',
                                        const Color(0xffFF9B9B),
                                        const Color(0xffFFB793),
                                        'Birthday'),
                                    SceneItem(
                                        'assets/surface2.svg',
                                        const Color(0xffAA93EB),
                                        const Color(0xffD193EB),
                                        'Party'),
                                    SceneItem(
                                        'assets/surface2.svg',
                                        const Color(0xff93CCEB),
                                        const Color(0xff93D9EB),
                                        'Relax'),
                                    SceneItem(
                                        'assets/surface2.svg',
                                        const Color(0xff8ADD94),
                                        const Color(0xffB5E992),
                                        'Fun'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                ),
                roomSelected
                    ? Align(
                        // right: MediaQuery.of(context).size.width*0.1,
                        // bottom: MediaQuery.of(context).size.height*0.7,
                        // left: MediaQuery.of(context).size.width*0.9 ,
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                bulbColor = bulbColor != Colors.black
                                    ? Colors.black
                                    : Colors.yellow;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20.0,
                              child: SvgPicture.asset(
                                  'assets/Icon awesome-power-off.svg'),
                            ),
                          ),
                        ))
                    : Container()
              ]),
            )
          ],
        ));
  }

  void changeUI() {
    setState(() {
      _slideAnimationController.forward();
      _fadeAnimationController.forward();
      roomSelected = true;
    });
  }

  void backButtonPressed() {
    setState(() {
      _slideAnimationController.reverse();
      _fadeAnimationController.reverse();
      roomSelected = false;
    });
  }
}

class SceneItem extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String assetName;
  final String scene;
  SceneItem(this.assetName, this.color1, this.color2, this.scene);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(assetName),
          const SizedBox(
            width: 5,
          ),
          Text(
            scene,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
