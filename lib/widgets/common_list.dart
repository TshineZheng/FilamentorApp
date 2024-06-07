import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class CommonList extends StatelessWidget {
  final List<Widget> children;
  const CommonList({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSliverGridList(
      horizontalGridSpacing: 16, // Horizontal space between grid items
      verticalGridSpacing: 16, // Vertical space between grid items
      horizontalGridMargin: 0, // Horizontal space around the grid
      verticalGridMargin: 0, // Vertical space around the grid
      minItemWidth: 300, // The minimum item width (can be smaller, if the layout constraints are smaller)
      minItemsPerRow: 1, // The minimum items to show in a single row. Takes precedence over minItemWidth
      maxItemsPerRow: 5, // The maximum items to show in a single row. Can be useful on large screens
      sliverChildBuilderDelegateOptions:
          SliverChildBuilderDelegateOptions(), // Options that are getting passed to the SliverChildBuilderDelegate() function
      children: children, // The list of widgets in the list
    );
  }
}
