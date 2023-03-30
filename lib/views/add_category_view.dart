import 'package:flutter/material.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryNameController =
        TextEditingController();
    final TextEditingController categoryEmojiController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              TextField(
                controller: categoryNameController,
              ),
              TextField(
                controller: categoryEmojiController,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Add Category'),
          ),
        ],
      ),
    );
  }
}
