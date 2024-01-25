import 'package:breadcrumbs/bread_crumb.dart';
import 'package:breadcrumbs/bread_crumb_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewBreadCrumbWidget extends StatefulWidget {
  const NewBreadCrumbWidget({super.key});

  @override
  State<NewBreadCrumbWidget> createState() => _NewBreadCrumbWidgetState();
}

class _NewBreadCrumbWidgetState extends State<NewBreadCrumbWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  context
                      .read<BreadCrumbProvider>()
                      .add(BreadCrumb(name: controller.text, isActive: false));
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please write the BreadCrumb'),
                    ),
                  );
                }
              },
              child: const Text('Add BreadCrumb'),
            ),
          ],
        ),
      ),
    );
  }
}
