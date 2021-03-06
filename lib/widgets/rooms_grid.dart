import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/room_item.dart';

class RoomsGrid extends StatefulWidget {
  Function changeUI;
  RoomsGrid(this.changeUI);
  @override
  _RoomsGridState createState() => _RoomsGridState();
}

class _RoomsGridState extends State<RoomsGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const BouncingScrollPhysics(),
      children: [
        GestureDetector(
            onTap: () {
              widget.changeUI();
            },
            child: RoomItem(
                assetName: 'assets/bed.svg',
                numLights: 4,
                roomName: 'Bed room')),
        GestureDetector(
          onTap: () {
            widget.changeUI();
          },
          child: RoomItem(
              assetName: 'assets/room.svg',
              numLights: 2,
              roomName: 'Living room'),
        ),
        GestureDetector(
          onTap: () {
            widget.changeUI();
          },
          child: RoomItem(
              assetName: 'assets/kitchen.svg',
              numLights: 3,
              roomName: 'Kitchen'),
        ),
        GestureDetector(
          onTap: () {
            widget.changeUI();
          },
          child: RoomItem(
              assetName: 'assets/bathtube.svg',
              numLights: 2,
              roomName: 'Bathroom'),
        ),
        GestureDetector(
          onTap: () {
            widget.changeUI();
          },
          child: RoomItem(
              assetName: 'assets/house.svg', numLights: 1, roomName: 'Outdoor'),
        ),
        GestureDetector(
          onTap: () {
            widget.changeUI();
          },
          child: RoomItem(
              assetName: 'assets/balcony.svg',
              numLights: 2,
              roomName: 'Balcony'),
        ),
      ],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0,
          mainAxisSpacing: MediaQuery.of(context).size.width * 0.08,
          crossAxisCount: 2,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.08),
    );
  }
}
