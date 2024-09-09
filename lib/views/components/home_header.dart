import 'package:flutter/material.dart';
import 'package:moneytracker/controller/transactions_provider.dart';
import 'package:moneytracker/views/components/widgets/header_card.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<TransactionsProvider>(context);

    final balance = provider.getBalance();
    final incomes = provider.getTotalIcome();
    final expenses = provider.getTotalExpense();

    return SizedBox(
        width: double.infinity,
        child: Column(children: [
          const SizedBox(height: 27),
          Text(
            'MONEY TRACKER',
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Balance:',
            style: textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Text(
            '\$ ${balance.toStringAsFixed(2)}',
            style: textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                HeaderCard(
                  title: 'Incomes',
                  amount: incomes,
                  icon: const Icon(
                    Icons.attach_money,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                HeaderCard(
                  title: 'Expences',
                  amount: expenses,
                  icon: const Icon(
                    Icons.money_off,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
