import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightItem extends StatelessWidget {
  final bool isDark;
  final String assetName;
  final String lightName;
  LightItem(this.isDark, this.assetName, this.lightName);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isDark ? const Color(0xff093B7B) : Colors.white;
    Color fontColor = isDark ? Colors.white : const Color(0xff093B7B);

    return Container(
      decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),color: backgroundColor),
        padding: const EdgeInsets.all(10),
        child: Row(mainAxisSize: MainAxisSize.min,children: [
          SvgPicture.asset(assetName, color: fontColor),
          const SizedBox(
            width: 5,
          ),
          Text(lightName,
              style: TextStyle(
                  color: fontColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500)),
        ]));
  }
}
