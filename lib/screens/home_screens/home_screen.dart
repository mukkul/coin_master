import 'package:coin_master/screens/transaction_screens/add_transaction.dart';
import 'package:coin_master/widgets/cards/card_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abhishek'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransaction()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: const [
              CardWidget(
                child: Text('Bank Account'),
              ),
              CardWidget(
                child: Text('Bank Account'),
              ),
              CardWidget(
                child: Text('Bank Account'),
              ),
              CardWidget(
                child: Text('Bank Account'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
