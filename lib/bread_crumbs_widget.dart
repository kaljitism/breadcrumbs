import 'dart:collection';

import 'package:breadcrumbs/bread_crumb.dart';
import 'package:flutter/material.dart';

class BreadCrumbsWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumbs;
  const BreadCrumbsWidget({
    super.key,
    required this.breadCrumbs,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs.map((breadCrumb) {
        return Text(
          breadCrumb.title,
          style: TextStyle(
            color: breadCrumb.isActive ? Colors.blue : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        );
      }).toList(),
    );
  }
}
