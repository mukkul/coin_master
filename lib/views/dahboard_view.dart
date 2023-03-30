import 'package:coin_master/views/add_transaction_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [
          CircleAvatar(
            child: FlutterLogo(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_circle_outline_rounded,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_)=>AddTransactionView(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Column(
                      children: const [
                        Text('Cash'),
                        Text('5000'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: const [
                        Text('Bank'),
                        Text('5000'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: const [
                        Text('Wallets'),
                        Text('5000'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: const [
                        Text('Credits'),
                        Text('5000'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Total'),
                  Text('66465546'),
                ],
              ),
            ),
            Divider(),
            Text('Transactions on 23-03-2023'),
            Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Food'),
                Text('Rs 200'),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
