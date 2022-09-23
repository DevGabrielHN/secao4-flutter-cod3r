import 'dart:math';

import 'package:despesas/components/chart.dart';
import 'package:despesas/components/transaction_form.dart';
import 'package:despesas/components/transaction_list.dart';
import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

  
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    home: MyApp(),
    theme: ThemeData(
      textTheme: ThemeData.light().textTheme.copyWith(
        titleLarge: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      fontFamily: 'Quicksand'
    ).copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(
        primary: Colors.purple,
        secondary: Colors.amber,
      )
    ),
  ),);
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


final List<Transaction> _transactions = [];


  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }


  _addTransaction(String title,double value,DateTime date){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title:  title,
      value: value, 
      date: date
      );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();

  }
  

  _deleteTransaction(String id){
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }



  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_) {
          return TransactionForm(_addTransaction);
        },
      );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
          actions: <Widget> [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _openTransactionFormModal(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Chart(recentTransaction: _recentTransactions),
                TransactionList(
                transaction: _transactions,
                onRemove: _deleteTransaction),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}
