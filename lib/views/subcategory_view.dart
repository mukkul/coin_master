import 'package:flutter/material.dart';

class AddSubCategoryView extends StatelessWidget {
  const AddSubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Subcategory'),
      ),
      body: Column(
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              Card(
                child: Column(
                  children: const [
                    Icon(
                      Icons.coffee_maker_rounded,
                    ),
                    Text('Breakfast'),
                  ],
                ),
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
