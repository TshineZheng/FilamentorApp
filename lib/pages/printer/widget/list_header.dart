import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final String name;
  final VoidCallback? onHelp;
  final Widget? trailing;
  const ListHeader(this.name, {super.key,this.onHelp, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: SizedBox(
        height: 38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(name, style: Theme.of(context).textTheme.titleLarge),
                if (onHelp != null) IconButton(onPressed: onHelp, icon: const Icon(Icons.help)),
              ],
            ),
            if (trailing != null) trailing!
          ],
        ),
      ),
    );
  }
}
