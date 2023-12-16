import 'package:coin_master/utils/localization/localization_util.dart';
import 'package:coin_master/widgets/buttons.dart';
import 'package:coin_master/widgets/input_field.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late final TextEditingController _categoryNameController;
  String? categoryEmoji;

  @override
  void initState() {
    super.initState();
    _categoryNameController = TextEditingController();
  }

  @override
  void dispose() {
    _categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalizationUtil.getTranslatedString('addCategory'),
        ),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Buttons.primary(
          onPressed: () {},
          child: Text(
            LocalizationUtil.getTranslatedString('addCategory'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 18.0,
            ),
            InputField(
              textEditingController: _categoryNameController,
              hintText: LocalizationUtil.getTranslatedString(
                'categoryName',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
