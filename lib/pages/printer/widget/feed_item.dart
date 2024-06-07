import 'package:filamentor_app/models/channel.gen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FeedItem extends StatelessWidget {
  final Channel feedTo;
  final Channel feedFrom;
  const FeedItem({super.key, required this.feedTo, required this.feedFrom});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(color: HexColor('#dbe4ee'), borderRadius: BorderRadius.circular(15)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ChannelIcon(index: 0, channel: feedTo),
          Icon(Icons.sync_alt),
          // ChannelIcon(index: 1, channel: feedFrom),
        ],
      ),
    );
  }
}
