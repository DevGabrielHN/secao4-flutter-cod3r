import 'dart:math';

import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 210.30,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title,double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title:  title,
      value: value, 
      date: DateTime.now()
      );

    setState(() {
      _transactions.add(newTransaction);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(transaction: _transactions),
      ],
    );
  }
}