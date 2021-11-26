import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/room_item.dart';

class RoomsGrid extends StatefulWidget {
  const RoomsGrid({Key? key}) : super(key: key);

  @override
  _RoomsGridState createState() => _RoomsGridState();
}

class _RoomsGridState extends State<RoomsGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const BouncingScrollPhysics(),
      children: [
        RoomItem(assetName: 'assets/bed.svg', numLights: 4, roomName: 'Bed room'),
        RoomItem(assetName: 'assets/room.svg', numLights: 2, roomName: 'Living room'),
        RoomItem(assetName: 'assets/kitchen.svg', numLights: 3, roomName: 'Kitchen'),
        RoomItem(assetName: 'assets/bathtube.svg', numLights: 2, roomName: 'Bathroom'),
        RoomItem(assetName: 'assets/house.svg', numLights: 1, roomName: 'Outdoor'),
        RoomItem(assetName: 'assets/balcony.svg', numLights: 2, roomName: 'Balcony'),
      ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0,
          mainAxisSpacing:  MediaQuery.of(context).size.width * 0.08,
            crossAxisCount: 2,
            crossAxisSpacing: MediaQuery.of(context).size.width * 0.08),
          );
  }
}
