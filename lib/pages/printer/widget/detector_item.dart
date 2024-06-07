import 'package:filamentor_app/models/detector.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class DetectorItem extends StatelessWidget {
  final Detector detector;
  final VoidCallback? onTap;
  const DetectorItem({super.key, required this.detector, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    detector.name,
                    style: TextStyle(color: HexColor('#1a7072')),
                  ),
                  const SizedBox(height: 20),
                  Text(detector.info),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const OutlinedButton(
                        onPressed: null,
                        child: Text('测试连接'),
                      ),
                      const SizedBox(width: 20),
                      OutlinedButton(
                        onPressed: () async {
                          final url = Uri.parse(detector.url);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: const Text('查看详情'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(color: HexColor('#dbe4ee'), borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  detector.name,
                  style: TextStyle(color: HexColor('#1a7072')),
                ),
                const SizedBox(height: 10),
                Text(detector.shortInfo, style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            const Spacer(),
            const Icon(Icons.info_outline),
          ],
        ),
      ),
    );
  }
}
