import 'package:breadcrumbs/bread_crumb_provider.dart';
import 'package:breadcrumbs/bread_crumbs_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breadcrumbs'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<BreadCrumbProvider>(
                builder: (context, value, child) {
                  return BreadCrumbsWidget(
                    breadCrumbs: value.items,
                  );
                },
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/new');
                },
                child: const Text('Add a new Bread Crumb'),
              ),
              TextButton(
                onPressed: () {
                  context.read<BreadCrumbProvider>().reset();
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
