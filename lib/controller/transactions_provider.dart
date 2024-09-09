import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';

class TransactionsProvider extends ChangeNotifier {
  // todo lo que tenga _ es privado
  final List<Transaction> _transactions = [
    // Transaction(
    //   type: TransactionType.income,
    //   amount: 1000,
    //   description: 'Salary',
    // ),
    // Transaction(
    //   type: TransactionType.expense,
    //   amount: -400,
    //   description: 'Rent',
    // ),
  ];

  //metodo get para leer lo tenga _trasactions
  List<Transaction> get transactions => _transactions;

  double getTotalIcome() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getTotalExpense() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getBalance() {
    return getTotalIcome() + getTotalExpense();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
