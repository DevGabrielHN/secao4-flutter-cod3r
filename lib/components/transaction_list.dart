import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transaction}) : super(key: key);

  final List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 365,
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (ctx,index) {
          final tr = transaction[index];
          return Card(
                      child: Row(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'R\$ ' + tr.value.toStringAsFixed(2),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),Column(
                             children: <Widget> [
                              Text(tr.title),
                              Text(DateFormat('d MMM y','pt_BR').format(tr.date)),
                        ],),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}