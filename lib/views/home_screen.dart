import 'package:flutter/material.dart';
import 'package:moneytracker/views/components/add_transactions_dialog.dart';
import 'package:moneytracker/views/components/transactions_list.dart';
import 'package:moneytracker/views/components/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            HomeHeader(),
            TrasactionsList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            //View Modal bottom sheet
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const AddTransactionsDialog(),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
