import 'package:breadcrumbs/bread_crumb_provider.dart';
import 'package:breadcrumbs/home_page.dart';
import 'package:breadcrumbs/new_bread_crumb_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BreadCrumbs());
}

class BreadCrumbs extends StatelessWidget {
  const BreadCrumbs({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: const HomePage(),
        routes: {
          '/new': (context) => const NewBreadCrumbWidget(),
        },
      ),
    );
  }
}
