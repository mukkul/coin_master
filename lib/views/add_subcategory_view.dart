import 'package:flutter/material.dart';

class AddSubCategoryView extends StatelessWidget {
  const AddSubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController subCategoryNameController =
        TextEditingController();
    final TextEditingController subCategoryEmojiController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Subcategory'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              TextField(
                controller: subCategoryNameController,
              ),
              TextField(
                controller: subCategoryEmojiController,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Add Subcategory'),
          ),
        ],
      ),
    );
  }
}
