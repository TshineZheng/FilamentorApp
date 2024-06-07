import 'package:filamentor_app/models/controller.gen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ControllerItem extends StatelessWidget {
  final Controller controller;
  const ControllerItem({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(color: HexColor('#dbe4ee'), borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.alias,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              Text(controller.des, style: const TextStyle(fontSize: 12.0)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('通道数量：${controller.channels.length}'),
            ],
          ),
        ],
      ),
    );
  }
}
