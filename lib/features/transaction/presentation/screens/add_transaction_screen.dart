import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_master/features/transaction/domain/entities/transaction_entity.dart';
import 'package:coin_master/features/transaction/domain/entities/transaction_type.dart';
import 'package:coin_master/utils/ui/custom_text_fields.dart';
import 'package:coin_master/widgets/buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  late final TextEditingController amountController;
  late final TextEditingController categoryController;
  late final TextEditingController dateTimeController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    categoryController = TextEditingController();
    dateTimeController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    amountController.dispose();
    categoryController.dispose();
    dateTimeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add transaction'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:18.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                CustomTextFields.borderedTextField(
                  controller: descriptionController,
                  hintText: 'Expense Description',
                ),
                const SizedBox(height: 10,),
                CustomTextFields.borderedTextField(
                  controller: amountController,
                  hintText: 'Amount',
                ),
                const SizedBox(height: 10,),
                CustomTextFields.borderedTextField(
                  controller: categoryController,
                  hintText: 'Category Emoji',
                ),
                const SizedBox(height: 10,),
                CustomTextFields.borderedTextField(
                  controller: dateTimeController,
                  hintText: 'Expense Date Time',
                ),
              ],
            ),
          ),
          Buttons.primary(
            onPressed: (){
              TransactionEntity transaction = TransactionEntity(
                amount: double.parse(amountController.text.trim()),
                description: descriptionController.text.trim(),
                category: categoryController.text.trim(),
                transactionDateTime: Timestamp.fromMicrosecondsSinceEpoch(DateTime.parse(dateTimeController.text.trim()).microsecondsSinceEpoch),
                transactionType: TransactionType.debit,
              );
            },
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
