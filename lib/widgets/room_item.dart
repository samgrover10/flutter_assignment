import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomItem extends StatelessWidget {
  final String assetName;
  final String roomName;
  final int numLights;
  RoomItem(
      {required this.assetName,
      required this.numLights,
      required this.roomName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              assetName,
              width: 40,
              height: 40,
            ),
            const SizedBox(height: 10,),
            AutoSizeText(roomName,
            maxLines: 1,
            maxFontSize: 20.0,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff393939))),
                    // const SizedBox(height: 10,),
            AutoSizeText("$numLights lights",
            maxLines: 1,
            maxFontSize: 15.0,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)));
  }
}
