import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String,double,DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  _submitForm(){
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if(title.isEmpty || value <= 0 || _selectedDate == null){
      return;
    }

    widget.onSubmit(title,value,_selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null){
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });

    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget> [ 
                    TextField(
                      onSubmitted: (_) => _submitForm(),
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Titulo', 
                      ),
                    ),
                    TextField(
                      onSubmitted: (_) => _submitForm(),
                      controller: _valueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Valor (R\$)', 
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: [
                          Text(
                            _selectedDate == null
                            ?'Nenhuma data selecionada!'
                            :'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',style: Theme.of(context).textTheme.bodyLarge,),
                          SizedBox(width: 10,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                            onPressed: _showDatePicker,
                            child: Text('Selecionar data',style: TextStyle(color: Colors.purple),))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget> [
                        ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: Text('Nova transação'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                          ),
                      ],
                    )
                ]),
              ),
            );
  }
  
}