import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transaction, required this.onRemove}) : super(key: key);

  final List<Transaction> transaction;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 410,
      child: transaction.isEmpty? Column(
        children: [
          Text('Nenhuma Transação Cadastrada!',
          style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 20,),  
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ) : ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (ctx,index) {
          final tr = transaction[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(child: Text('R\$${tr.value}'),
                  ),
                ),
              ),
              title: Text(
                tr.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => onRemove(tr.id),
              ),
            ),
          );
        },
      ),
    );
  }
}