import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/room_item.dart';
import 'package:flutter_assignment/widgets/rooms_grid.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final assetName = "assets/bed.svg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0A4DA2),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
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
            ),
            const SizedBox(height: 30),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                  color: Color(0xffF6F8FB),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "All Rooms",
                    minFontSize: 18.0,
                    maxLines: 1,
                    style: TextStyle(
                        color: Color(0xff002D67), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),
                  Expanded(child: RoomsGrid()),
                ],
              ),
            ))
          ],
        ));
  }
}
