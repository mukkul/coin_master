import 'package:coin_master/screens/category_screens/add_category.dart';
import 'package:coin_master/utils/localization/localization_util.dart';
import 'package:coin_master/widgets/button.dart';
import 'package:coin_master/widgets/input_field.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  late final TextEditingController _amountController;
  late final TextEditingController _transactionDateTime;
  late final TextEditingController _transactionDescription;
  String? _transactionCategory;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _transactionDateTime = TextEditingController();
    _transactionDescription = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _transactionDateTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      floatingActionButton: SizedBox(
        width: 400,
        child: Buttons.primary(
          onPressed: () {},
          child: Text(
            LocalizationUtil.getTranslatedString('addTransaction'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            InputField.withBorder(
              textEditingController: _amountController,
              hintText:
                  LocalizationUtil.getTranslatedString('transactionAmount'),
            ),
            const SizedBox(
              height: 16,
            ),
            DropdownButton(
              isExpanded: true,
              value: _transactionCategory,
              hint: Text(
                LocalizationUtil.getTranslatedString('transactionCategory'),
              ),
              items: [
                const DropdownMenuItem(
                  value: 'tea',
                  child: Text('Tea'),
                ),
                const DropdownMenuItem(
                  value: 'snacks',
                  child: Text('Snacks'),
                ),
                const DropdownMenuItem(
                  value: 'food',
                  child: Text('Food'),
                ),
                DropdownMenuItem(
                  value: 'addCategory',
                  child: Text(
                    LocalizationUtil.getTranslatedString('addMoreCategory'),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'addCategory') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_)=>const AddCategory()),
                  );
                }
                setState(() {
                  _transactionCategory = value;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            InputField.withBorder(
              textEditingController: _transactionDateTime,
              hintText: LocalizationUtil.getTranslatedString('transactionDate'),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(
                    const Duration(
                      days: 99999999,
                    ),
                  ),
                  lastDate: DateTime.now().add(
                    const Duration(
                      days: 99999999,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            InputField.withBorder(
              textEditingController: _transactionDescription,
              maxLines: 3,
              hintText: LocalizationUtil.getTranslatedString(
                  'transactionDescription'),
            ),
          ],
        ),
      ),
    );
  }
}
