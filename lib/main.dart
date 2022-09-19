import 'package:despesas/components/transaction_user..dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

  
void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    home: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column (
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
              ),
            ),
           TransactionUser(),
          ],
        ),
      );
  }
}
