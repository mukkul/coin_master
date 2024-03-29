import 'package:coin_master/features/login/bloc/auth_bloc.dart';
import 'package:coin_master/features/transaction/presentation/screens/add_transaction_screen.dart';
import 'package:coin_master/widgets/cards/card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abhishek'),
        actions: [
          IconButton(
            onPressed: (){
              context.read<AuthBloc>().add(const AppSignOutRequested());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
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
