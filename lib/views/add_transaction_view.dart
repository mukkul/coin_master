import 'package:coin_master/views/add_category_view.dart';
import 'package:coin_master/views/category_view.dart';
import 'package:coin_master/views/subcategory_view.dart';
import 'package:flutter/material.dart';

class AddTransactionView extends StatefulWidget {
  const AddTransactionView({super.key});

  @override
  State<AddTransactionView> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionView> {
  final TextEditingController _transactionAmountController =
      TextEditingController();
  final TextEditingController _transactionDateController =
      TextEditingController();
  String? _expenseCategory;
  String? _expenseSubCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _transactionAmountController,
              decoration: const InputDecoration(
                hintText: '2322',
                border: OutlineInputBorder(),
              ),
            ),
            DropdownButton(
              value: _expenseCategory,
              items: const [
                DropdownMenuItem(
                  value: 'Food',
                  child: Text('Food'),
                ),
                DropdownMenuItem(
                  value: 'new',
                  child: const Text('Add new Category'),
                ),
              ],
              onChanged: (value) {
                if (value == 'new') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddCategoryView(),
                    ),
                  );
                } else {
                  setState(() {
                    _expenseCategory = value!;
                  });
                }
              },
            ),
            DropdownButton(
              value: _expenseSubCategory,
              items: [
                const DropdownMenuItem(
                  value: 'Breakfast',
                  child: Text('Breakfast'),
                ),
                DropdownMenuItem(
                  value: 'new',
                  child: const Text('Add new Category'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddSubCategoryView(),
                      ),
                    );
                  },
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _expenseSubCategory = value!;
                });
              },
            ),
            TextField(
              controller: _transactionDateController,
              decoration: const InputDecoration(hintText: '23-03-2023'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
